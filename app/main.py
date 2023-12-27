from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
from pydantic import BaseModel, Field, BaseSettings
from sqlalchemy import create_engine, Column, Integer, String, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, relationship
from prometheus_fastapi_instrumentator import Instrumentator

# Database configuration
import os

class Settings(BaseSettings):
    db_url: str = Field(..., env='DATABASE_URL')

settings = Settings()

#from .config import settings
#database = databases.Database(settings.db_url)
#DATABASE_URL = "postgresql://postgres:postgres123@192.168.1.30/db_app001"

engine = create_engine(settings.db_url)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

# Define User model
class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, index=True)
    email = Column(String, index=True)
    course_id = Column(Integer, ForeignKey("courses.id_cours"))
    
    course = relationship("Course", back_populates="users")

# Define Course model
class Course(Base):
    __tablename__ = "courses"

    id_cours = Column(Integer, primary_key=True, index=True)
    course_name = Column(String, index=True)

    users = relationship("User", back_populates="course")

# Create tables in the database
Base.metadata.create_all(bind=engine)

# FastAPI app setup
app = FastAPI()

# Prometheus monitoring setup
Instrumentator().instrument(app).expose(app)

# CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Pydantic models for request and response
class UserCreate(BaseModel):
    name: str
    email: str

class CourseCreate(BaseModel):
    course_name: str

class UserResponse(UserCreate):
    id: int

class CourseResponse(CourseCreate):
    id_cours: int

# Endpoints
@app.post("/users/", response_model=UserResponse)
def create_user(user: UserCreate):
    db = SessionLocal()
    db_user = User(**user.dict())
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    db.close()
    return db_user

@app.put("/users/{user_id}", response_model=UserResponse)
def update_user(user_id: int, user: UserCreate):
    db = SessionLocal()
    db_user = db.query(User).filter(User.id == user_id).first()
    if db_user:
        db_user.name = user.name
        db_user.email = user.email
        db.commit()
        db.refresh(db_user)
    db.close()
    return db_user

@app.get("/users/{user_id}", response_model=UserResponse)
def read_user(user_id: int):
    db = SessionLocal()
    db_user = db.query(User).filter(User.id == user_id).first()
    db.close()
    if db_user:
        return db_user
    else:
        raise HTTPException(status_code=404, detail="User not found")

@app.get("/users/", response_model=list[UserResponse])
def read_users(skip: int = 0, limit: int = 10):
    db = SessionLocal()
    users = db.query(User).offset(skip).limit(limit).all()
    db.close()
    return users

@app.delete("/users/{user_id}", response_model=UserResponse)
def delete_user(user_id: int):
    db = SessionLocal()
    db_user = db.query(User).filter(User.id == user_id).first()
    if db_user:
        db.delete(db_user)
        db.commit()
        db.close()
        return db_user
    else:
        db.close()
        raise HTTPException(status_code=404, detail="User not found")

@app.post("/courses/", response_model=CourseResponse)
def create_course(course: CourseCreate):
    db = SessionLocal()
    db_course = Course(**course.dict())
    db.add(db_course)
    db.commit()
    db.refresh(db_course)
    db.close()
    return db_course

@app.put("/courses/{course_id}", response_model=CourseResponse)
def update_course(course_id: int, course: CourseCreate):
    db = SessionLocal()
    db_course = db.query(Course).filter(Course.id_cours == course_id).first()
    if db_course:
        db_course.course_name = course.course_name
        db.commit()
        db.refresh(db_course)
    db.close()
    return db_course

@app.get("/courses/{course_id}", response_model=CourseResponse)
def read_course(course_id: int):
    db = SessionLocal()
    db_course = db.query(Course).filter(Course.id_cours == course_id).first()
    db.close()
    if db_course:
        return db_course
    else:
        raise HTTPException(status_code=404, detail="Course not found")

@app.get("/courses/", response_model=list[CourseResponse])
def read_courses(skip: int = 0, limit: int = 10):
    db = SessionLocal()
    courses = db.query(Course).offset(skip).limit(limit).all()
    db.close()
    return courses

@app.delete("/courses/{course_id}", response_model=CourseResponse)
def delete_course(course_id: int):
    db = SessionLocal()
    db_course = db.query(Course).filter(Course.id_cours == course_id).first()
    if db_course:
        db.delete(db_course)
        db.commit()
        db.close()
        return db_course
    else:
        db.close()
        raise HTTPException(status_code=404, detail="Course not found")

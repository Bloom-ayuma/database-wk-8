# database-wk-8
# Clinic Booking System

## Description
A full-featured MySQL-based Clinic Booking System with a FastAPI backend for managing patients, doctors, and appointments.

## Features
- SQL database with tables for departments, doctors, patients, and appointments
- FastAPI CRUD API for patient management
- Sample SQL data included

## Setup Instructions

### 1. MySQL Setup
- Run `clinic_booking.sql` in MySQL Workbench or CLI to create schema and seed data.

### 2. Python Environment
```bash
pip install -r requirements.txt
uvicorn main:app --reload

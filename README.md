# Task Management System

## Project Overview

This repository contains a full-stack Task Management System built for a technical assessment. The backend is a Node.js + Express.js API written in TypeScript and backed by PostgreSQL with Prisma. The frontend is a React + TypeScript application built with Vite and Tailwind CSS.

## Technology Stack

- Frontend: React.js, TypeScript, Vite, Tailwind CSS, React Router, Axios
- Backend: Node.js, Express.js, TypeScript
- Database: PostgreSQL, Prisma
- Authentication: JWT access tokens

## Installation Instructions

1. Copy `.env.example` to `.env`.
2. Update database credentials and JWT secret in `.env`.
3. Install dependencies for backend and frontend.

## Environment Variables

Backend:

- `BACKEND_PORT` - port for backend API
- `DATABASE_URL` - PostgreSQL connection URL
- `JWT_SECRET` - secret used to sign JWT tokens
- `JWT_EXPIRES_IN` - JWT expiration duration

Frontend:

- `VITE_API_BASE_URL` - base URL for backend API requests

## Database Setup

1. Install PostgreSQL and create a database.
2. Set `DATABASE_URL` in `.env`.
3. Run `npm install` in `project/backend`.
4. Run `npm run migrate` from `project/backend`.
5. Run `npm run seed` from `project/backend`.

## Running the Backend

1. Install backend dependencies: `npm install` in `project/backend`.
2. Start development server: `npm run dev`.

## Running the Frontend

1. Install frontend dependencies: `npm install` in `project/frontend`.
2. Start development server: `npm run dev`.

## API Documentation

| Method | Path                   | Body                                                 | Response                                |
| ------ | ---------------------- | ---------------------------------------------------- | --------------------------------------- |
| POST   | `/api/auth/login`      | `{ email, password }`                                | `{ success, data: { token }, message }` |
| POST   | `/api/auth/logout`     | none                                                 | `{ success, message }`                  |
| GET    | `/api/tasks`           | query params                                         | `{ success, data: tasks, message }`     |
| GET    | `/api/tasks/:id`       | none                                                 | `{ success, data: task, message }`      |
| POST   | `/api/tasks`           | `{ title, description, priority, status, due_date }` | `{ success, data: task, message }`      |
| PUT    | `/api/tasks/:id`       | `{ title, description, priority, status, due_date }` | `{ success, data: task, message }`      |
| DELETE | `/api/tasks/:id`       | none                                                 | `{ success, message }`                  |
| GET    | `/api/dashboard/stats` | none                                                 | `{ success, data: stats, message }`     |

## Assumptions Made

- JWT is used as a stateless access token.
- Refresh tokens are not implemented.
- Password hashing uses bcrypt before storing credentials.

## Known Limitations

- No production-ready refresh token flow.
- Simple frontend state management without Redux.
- Backend does not include rate limiting or email verification.

# Private Events

Private Events is a Ruby on Rails application for creating events and tracking who plans to attend them. Users can sign up, create their own events, browse all events, RSVP to events, and view user profiles with created and attended events.

## Features

- User registration, login, logout, password reset, and remember-me support through Devise.
- Public event index at the root path, showing all upcoming events with names, locations, dates, and links to event details.
- Authenticated event creation, with each event automatically associated with the signed-in user as its creator.
- Event detail pages with the event name, location, date, description, creator email, attendance action, and attendee list.
- RSVP/attendance tracking through an `EventAttendance` join model between users and events.
- Authentication-protected attendance creation, with signed-out users prompted to sign in before attending.
- User profile pages that show events a user created and events they are attending.
- Relational data model for event creators, attendees, attended events, and created events.
- SQLite-backed development and test databases.
- Rails health check endpoint at `/up`.
- Rails 8 app structure with import maps, Turbo, Stimulus, Propshaft, Solid Queue, Solid Cache, and Solid Cable.
- Docker and Kamal deployment configuration included.
- Security and quality tooling through Brakeman, bundler-audit, and RuboCop Rails Omakase.

## Tech Stack

- Ruby on Rails 8.1
- SQLite
- Devise
- Turbo and Stimulus
- Propshaft
- Puma

## Data Model

- `User`
  - Has many created events.
  - Has many event attendances.
  - Has many attended events through event attendances.

- `Event`
  - Belongs to a creator, which is a user.
  - Has many event attendances.
  - Has many attendees through event attendances.

- `EventAttendance`
  - Belongs to an attendee, which is a user.
  - Belongs to an attended event.

## Routes

- `/` - event index
- `/events` - event index
- `/events/new` - new event form for signed-in users
- `/events/:id` - event details
- `/event_attendances` - create attendance records
- `/users/:id` - user profile
- Devise user authentication routes
- `/up` - Rails health check

## Getting Started

Install dependencies:

```sh
bundle install
```

Prepare the database:

```sh
bin/rails db:prepare
```

Start the development server:

```sh
bin/rails server
```

Open the app at `http://localhost:3000`.

## Running Tests

```sh
bin/rails test
```

## Code Quality

Run the configured checks:

```sh
bin/rubocop
bin/brakeman
bin/bundler-audit
```

Or run the project CI script:

```sh
bin/ci
```

<h1 align="center">Open Space 🚀 📝 </h1>

<div align="center">
  A full stack <code>React.js</code> and <code>Ruby on Rails</code> web app aimed to provide a safe space for sharing kind words to folks who need them.
</div>

<div align="center">
  <sub>Built with ❤️ and ✨ by
  <a href="https://github.com/janetmndz">Janet Mendez</a>
  </sub>
</div>

<br />

## See it Live: [https://open-space-fe.herokuapp.com/](https://open-space-fe.herokuapp.com/)

## Features
This web app aims to provide users a safe and open space where they can make posts on things that are bothering them. Users can only see posts with topics that they are subscribed to ensure that users have full control of what they want to see. Users can send notes to other user's posts as encouragement. These notes are private and can only be seen by the recipient as well as validated with IBM Watson Tone Analyzer to ensure they are kind words. 

## Tech Stack
This web app makes use of the following:

**Backend**
- Ruby [2.6.1]
- Rails [~> 5.2.3] - MVC web framework used as an API
- PostgreSQL [>= 0.18, < 2.0] - Database
- bcrypt [~> 3.1.7] - Gem for encryption and securing user passwords
- Figaro - Rails gem for securing API Keys
- Active Model Serializers - Serializing API routes to JSON
- JWT - securing tokens
- IBM Watson - Ruby SDK for IBM Watson
- Heroku - App deployment 

**Front End**
- React.js
- React Router - Declarative Routing
- SCSS - CSS pre-processor

## Prerequisites
Before you begin, ensure you have installed the latest version of:

- [**Ruby**](https://www.ruby-lang.org/en/)
- [**Rails**](https://rubyonrails.org/)
- [**PostgreSQL**](https://www.postgresql.org/)
- [**Node.js and npm**](https://nodejs.org/en/)

This web app uses the following API keys from:
- [**IBM Watson - Tone Analyzer**](https://www.ibm.com/watson)

## Installing
*For information on Frontend Installation please click here: [Open Space Frontend](https://github.com/janetmndz/open-space-frontend)*

**Backend Installation:**

- Clone this repo to your local machine `git clone <this-repo-url>`
- `cd` to backend directory
- run `bundle install` to install requiered dependencies
- Ensure you have a JWT Secret Key
- Add jwt secert key in the `/config/application.yml` file like so: 
```
jwt_secret_key: 'YOUR_SECRET_KEY'
```
- Ensure you have your IBM Watson Credentials
- Add credentials in the `/config/application.yml` file like so: 
```
ibm_watson_key: 'IBM_WATSON_KEY'
ibm_watson_version: 'IBM_WATSON_VERSION'
ibm_watson_url: 'IBM_WATSON_URL'
```
- Ensure you have PostgreSQL running
- run `rails db:create` to create a database locally.
- run `rails db:migrate` to create tables into the database.
- run `rails db:seed` to create seed data.
- run `rails s` to run the server.
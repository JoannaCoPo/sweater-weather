# Sweater Weather
![Image](https://media.giphy.com/media/wZtxnyxWTImyzpRxf1/giphy.gif)  
[via GIPHY](https://giphy.com/embed/wZtxnyxWTImyzpRxf1)

### Welcome to Sweater Weather:
#### Back-end development for an application that helps users plan road trips

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## Table of Contents

- [Overview](#overview)
- [Tools Utilized](#framework)


### Overview

`Sweater Weather`: a fictional app that allows users to plan for road trips by accessing correlated weather and mapping data, providing the travel time as well as  forecasted weather for the trip destination.

### Learning Goals  

 - Expose an API that aggregates data from multiple external APIs
 - Expose an API that requires an authentication token
 - Expose an API for CRUD functionality
 - Determine completion criteria based on the needs of other developers
 - Research, select, and consume an API based on your needs as a developer

### Framework
<p>
  <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />
</p>

#### Languages
<p>
  <img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />
  <img src="https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white" />
</p>

### Tools
<p>
  <img src="https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white" />  
  <img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/Postman-FF6E4F.svg?&style=flat&logo=postman&logoColor=white" />
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1.svg?&style=flaste&logo=postgresql&logoColor=white" />
</p>

### Gems
<p>
  <img src="https://img.shields.io/badge/rspec-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/rubocop-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/fast-jsonapi-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/shoulda--matchers-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  </br>  
  <img src="https://img.shields.io/badge/capybara-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/bcrypt-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/figaro-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/webmock-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/vcr-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
</p>

### Development Principles
<p>
  <img src="https://img.shields.io/badge/OOP-b81818.svg?&style=flaste&logo=OOP&logoColor=white" />
  <img src="https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white" />
  <img src="https://img.shields.io/badge/MVC-b8b018.svg?&style=flaste&logo=MVC&logoColor=white" />
  <img src="https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white" />  
</p>


### <ins>Developers</ins>

👤  **Joanna Cortes Pomeo**
- Github: [Joanna Cortes Pomeo](https://github.com/JoannaCoPo)
- LinkedIn: [Joanna Cortes Pomeo](https://www.linkedin.com/in/joanna-cortes-pomeo-6b1a3aba/)

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/Bhjones45/tikiarte_be.svg?style=flat
[contributors-url]: https://github.com/dBhjones45/tikiarte_be/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Bhjones45/tikiarte_be.svg?style=flat
[forks-url]: https://github.com/Bhjones45/tikiarte_be/network/members
[stars-shield]: https://img.shields.io/github/stars/Bhjones45/tikiarte_be.svg?style=flat
[stars-url]: https://github.com/Bhjones45/tikiarte_be/stargazers
[issues-shield]: https://img.shields.io/github/issues/Bhjones45/tikiarte_be.svg?style=flat
[issues-url]: https://github.com/Bhjones45/tikiarte_be/issues


### Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Set up the database: `rails db:{create,migrate}`
4. Set up [API Access]

Find the [project spec here](https://backend.turing.edu/module3/projects/sweater_weather/)

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## Endpoints

#### Weather Forecast for a City

| Method   | URI                                      | Description                              |
| -------- | ---------------------------------------- | ---------------------------------------- |
| `GET`    | `/api/v1/forecast?location=<location>`   | Retrieves current, daily (5 days), and hourly (8 hours) forecast for a city|

##### Example:  
```
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2021-09-29 08:53:14 -0600",
                "sunrise": "2021-09-29 06:54:24 -0600",
                "sunset": "2021-09-29 18:45:45 -0600",
                "temperature": 61.05,
                "feels_like": 59.49,
                "humidity": 56,
                "uvi": 0.92,
                "visibility": 10000,
                "conditions": "scattered clouds",
                "icon": "03d"
            },
            "daily_weather": [
                {
                    "date": "2021-09-29",
                    "sunrise": "2021-09-29 06:54:24 -0600",
                    "sunset": "2021-09-29 18:45:45 -0600",
                    "max_temp": 70.7,
                    "min_temp": 51.55,
                    "conditions": "moderate rain",
                    "icon": "10d"
                },
                {
                    "date": "2021-09-30",
                    "sunrise": "2021-09-30 06:55:21 -0600",
                    "sunset": "2021-09-30 18:44:07 -0600",
                    "max_temp": 61.12,
                    "min_temp": 48.7,
                    "conditions": "moderate rain",
                    "icon": "10d"
                },
                {
                    "date": "2021-10-01",
                    "sunrise": "2021-10-01 06:56:19 -0600",
                    "sunset": "2021-10-01 18:42:29 -0600",
                    "max_temp": 67.44,
                    "min_temp": 54.28,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "date": "2021-10-02",
                    "sunrise": "2021-10-02 06:57:16 -0600",
                    "sunset": "2021-10-02 18:40:52 -0600",
                    "max_temp": 70.88,
                    "min_temp": 56.88,
                    "conditions": "light rain",
                    "icon": "10d"
                },
                {
                    "date": "2021-10-03",
                    "sunrise": "2021-10-03 06:58:15 -0600",
                    "sunset": "2021-10-03 18:39:15 -0600",
                    "max_temp": 77.4,
                    "min_temp": 57.67,
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "08:00:00",
                    "temperature": 61.07,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "time": "09:00:00",
                    "temperature": 61.05,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "time": "10:00:00",
                    "temperature": 61.61,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "time": "11:00:00",
                    "temperature": 63,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "time": "12:00:00",
                    "temperature": 64.94,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "time": "13:00:00",
                    "temperature": 67.32,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "14:00:00",
                    "temperature": 70.7,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "15:00:00",
                    "temperature": 70.36,
                    "conditions": "light rain",
                    "icon": "10d"
                }
            ]
        }
    }
}
```

#### Background Image for a City

| Method   | URI                                      | Description                              |
| -------- | ---------------------------------------- | ---------------------------------------- |
| `GET`    | `/api/v1/backgrounds?location=<location>`| Retrieves relevant background image for city|

##### Example:  
```
{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "location": "denver,co",
            "image_url": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNjM0MDV8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzI5MjczOTQ&ixlib=rb-1.2.1&q=85",
            "credit": {
                "source": "unsplash.com",
                "author": "Ryan De Hamer",
                "profile": "https://unsplash.com/@rdehamer"
            }
        }
    }
}
```

#### User Registration

| Method   | URI                      | Description                              |
| -------- | -------------------------| ---------------------------------------- |
| `POST`   | `/api/v1/users`          | Creates a user in the database and returns the user email and api_key|

##### Example:
```
{
    "data": {
        "id": "9",
        "type": "user",
        "attributes": {
            "email": "jo@example.com",
            "api_key": "wmTmzcG4iAbx6Xzw2XxAR5WA"
        }
    }
}
```

#### User Login

| Method   | URI                      | Description                              |
| -------- | -------------------------| ---------------------------------------- |
| `POST`   | `/api/v1/sessions`       | Creates a user session and and returns the user email and api_key|

##### Example:
```
{
    "data": {
        "id": "9",
        "type": "user",
        "attributes": {
            "email": "jo@example.com",
            "api_key": "wmTmzcG4iAbx6Xzw2XxAR5WA"
        }
    }
}
```

#### Road Trips

| Method   | URI                      | Description                              |
| -------- | -------------------------| ---------------------------------------- |
| `POST`   | `/api/v1/road_trip`      | Returns route details such as travel time and weather at arrival|

##### Example:
```
{
    "data": {
        "id": null,
        "type": "road_trip",
        "attributes": {
            "start_city": "Denver, CO",
            "end_city": "Pueblo, CO",
            "travel_time": "1 hour(s), 44 minute(s)",
            "weather_at_eta": {
                "temperature": 65.5,
                "conditions": "clear sky"
            }
        }
    }
}
```

### <ins>Project Configurations</ins>

* Ruby Version
    ```bash
    $ ruby -v
    ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
    ```

* [System Dependencies](https://github.com/Bhjones45/tikiarte_be/blob/main/Gemfile)
    ```bash
    $ rails -v
    Rails 5.2.6
    ```

* Database Creation
    ```bash
    $ rails db:{drop,create,migrate,seed}
    Created database 'sweater_weather_development'
    Created database 'sweater_weather_test'
    ```

* API Access
  - Request an API key from...

      ```bash
      Code Optional Here
      ```

* How to run the test suite:
    ```bash
    $ bundle exec rspec -fd
    ```

* [Local Deployment](http://localhost:3000), for testing:
    ```bash
    $ rails s
  => Booting Puma
  => Rails 5.2.6 application starting in development
  => Run `rails server -h` for more startup options
  Puma starting in single mode...
  * Version 3.12.6 (ruby 2.7.2-p137), codename: Llamas in Pajamas
  * Min threads: 5, max threads: 5
  * Environment: development
  * Listening on tcp://localhost:3000
  Use Ctrl-C to stop
    ```
#### Ackowledgements
The following external API's were used in this project:  
 - [MapQuest’s Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/)  
 - [OpenWeather One Call API](https://openweathermap.org/api/one-call-api)
 - [Unsplash](https://unsplash.com/developers)
   - Please note Upsplash's [photographer credit guidelines](https://help.unsplash.com/en/articles/2612337-do-i-have-to-give-credit-to-a-photographer-when-i-use-their-photo)

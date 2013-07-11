![WHO RUN IT](http://i.minus.com/iFQ6RJ7jHO4LB.png "WHO RUN IT")

> WHO RUN IT - a distributed running club for the web.

<http://whorunit.herokuapp.com>

Created by:

- Mark Morris [@blurredbits](http://www.twitter.com/blurredbits) - <mmorris00@mac.com>
- Matt Hoover [@mthoover1](http://www.twitter.com/mthoover1) - <mthoover1@gmail.com>
- Jeff Belser [@JustAboutJeff](http://www.twitter.com/justaboutjeff) - <JustAboutJeff@gmail.com>

##About

Phase 3 Final Project for DevBootcamp (Chicago, IL)

Original idea by Jeff Belser - With over 30 million runners in the US, the app was pitched as a new take on existing running club sites to promote social running activities. Original inspiration was to provide a method to notify and connect runners of similar abilities, paces and mileage preferences in their area. 

Application uses both email and sms text messages to alert users of running events close to their chosen locations. Users are able to create multiple locations for alerts. Once notified, users are able to commit to particular runs and save favorite running routes for future use.


##Install

- Fork the repo and clone the files onto your local machine:

    	$ git clone https://github.com/JustAboutJeff/who_run_it.git

- Navigate to the application directoy in terminal and run **bundle install** to gather the required gems:

    	$ bundle install

- Depending on your local development environment, you may need to create and save out a **.ruby-gemset** and/or **.ruby-version** dot file(s) within the main application directory to configure your gemset and ruby version.

- Within the app's config directory open the **local_env.yaml.sample** file and define the environment variables for your local configuration. Save a new copy as **local_env.yaml**. Check the config/environments directory to view the settings these environment variables control:

    	GOOGLE_MAPS_KEY: 'insert key for (DEV/TEST/PROD)'
    	GMAIL_USERNAME: 'insert username for (DEV/TEST)'
    	GMAIL_PASSWORD: 'insert password for (DEV/TEST)'
    	SENDGRID_USERNAME: 'insert username for (PROD)'
    	SENDGRID_PASSWORD: 'insert password for (PROD)'
    	TWILIO_SID: 'insert key for (DEV/TEST/PROD)'
    	TWILIO_AUTH_TOKEN: 'insert token for (DEV/TEST/PROD)'
    	TWILIO_PHONE_NUMBER: 'insert phone number for (DEV/TEST/PROD)'

- Run the rake commands to create, migrate and seed a postgres db:

    	$ rake db:create && rake db:migrate && rake db:seed

- Launch the application server:

		$ rails s

- Open a broswer and navigate to localhost:3000

- Enjoy

##Usage

Please consult the production version of the app hosted on heroku for a live demonstration:

<http://whorunit.herokuapp.com>

##Design

As a green field project, hand drawn wireframes drove the initial design. Once we achieved a simple MVP, features were added on the fly. Most of the design revolved around internal conversations - "The app should do this" or "We really need this here". As a consequence, most of the features did not make it the product backlog (pivotal tracker) and resulted in daily standups that didn't necessarily reflect what was happening in the project documentation.

We went through several iterations within the database design, resulting in a dynamic schema.

Styling was inspired by current running gear.  

Pros:

* Fluid, iterative approach to feature additions
* Strong communication between team members

Cons:

* Untracked features left significant gaps in the product backlog (Twilio, ActionMailer, Leaflet Animation, etc..)
* Iterative design made it difficult to define a "feature lock" point in the project.


##Testing

Given the dynamic nature of the application - testing proved to be difficult. Without settling on a relatively static schema, initial unit testing remained incomplete until late in the project. Initial integration testing was developed for basic functions such as user login & signup, but also lagged behind as new features were added. The bright spot of the tests were the controller and routing tests that were completed mid-way thru the project.

Lessons Learned:

* You build it, you test it. We would have been better off holding code merges until testing was complete by the original developer.

* Difficult tests exposed tightly coupled code, and highlighted refactoring opportunities.

* Untested code exposed many last-minute fixes and patches.


===

Last Updated: Spring 2013


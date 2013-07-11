![WHO RUN IT](http://i.minus.com/iFQ6RJ7jHO4LB.png "WHO RUN IT")

> WHO RUN IT - a distributed running club for the web.

<http://whorunit.herokuapp.com>

Created by:

- Mark Morris [@blurredbits](http://www.twitter.com/blurredbits) - <mmorris00@mac.com>
- Matt Hoover [@mthoover1](http://www.twitter.com/mthoover1) - <mthoover1@gmail.com>
- Jeff Belser [@JustAboutJeff](http://www.twitter.com/justaboutjeff) - <JustAboutJeff@gmail.com>

##About

A final group project for Dev Bootcamp (Chicago, IL)

The original idea was pitched by Jeff Belser - a distance runner who moved to Chicago for Dev Bootcamp and struggled to find other runners to share a jog with outside of the formalized running club schedules.

Who Run It allows runners to build and share their runs and join other runs that match their available time slots, pace and/or distance preferences, and geographic location.

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

After the application is up and running you have the ability to begin playing with the run creation form and drawing your own routes. Click the **polyline tool** at the upper left corner of the map to begin drawing routes. Use the **sign up** or **sign in** links along the top navigation bar to logn into the app and begin saving and sharing your own runs.

Once logged in, you'll be directed to the user dashboard. The dashboard allos you to build new **run alerts**, view any of your previously **created runs**, view any previously created **routes**, and view any upcomming **notified runs** that you've been alerted to.

Please consult the production version of the application hosted on heroku for a live demonstration:

<http://whorunit.herokuapp.com>

##Design

As a green field project, hand drawn wireframes helped drive the initial design of our application. Once we achieved a simple MVP, features were outlined as Pivotal Tracker user stories and added as time permitted. Most of the design revolved around internal conversations - "The app should do this" or "We really need this here". As a consequence, each and every feature did not make it into the product backlog and resulted in daily standups that didn't necessarily reflect what was happening in the project documentation. That said, our team was made up of hard-working, low-ego, collaboration focused personalities that helped us make great progress despite a less than perfect methodology. 

For the front-end, we relied on the speed and flexibility of the Zurb Foundation framework and SASS to help build out a responsive interface. Our visual design decisions were guided by current workout and running gear trends.

On the back-end, our initial schema proved to be too simple as we began to drill down into the model relationships behind mapping and notifying runs. We came to the realization that we should be concerned with route objects, waypoint objects, location setting objects and a collection of notification helper classes. Seperating these concerns wasn't always executed perfectly but it helped us maintain a code base that we could better understand, refactor, and test.

- View our LocationSetting class [here](https://github.com/JustAboutJeff/who_run_it/blob/master/app/models/location_setting.rb)
- View our Notification worker class [here](https://github.com/JustAboutJeff/who_run_it/blob/master/app/workers/notification_worker.rb)


##Testing

Testing was a guiding force for the application early on in the project lifecycle, especially during the time leading up to delivering our MVP. However, given the dynamic nature of the workflow and tight deadline, testing proved to be difficult moving forward. Without settling on a relatively static schema, initial unit testing remained incomplete until late in the project. Initial integration testing was developed for basic functions such as user login & signup, but also lagged behind as new features were added. The bright spot of the tests were the controller and routing tests that were completed mid-way thru the project.

**Lessons Learned:**

- You build it, you test it. We would have been better off holding code merges until testing was complete by the contributing developer.
- Difficult tests exposed tightly coupled code, and highlighted refactoring opportunities.
- Untested code exposed many last-minute fixes and patches.


##Final Thoughts

Thanks to Dev Bootcamp for providing the structure and support to help make this project better. Abi Noda, Alex Koppel, Erik Allar, and Mitch Lee all provided insightful mentorship and feedback over the 7 days the application took to build. A few features we're excited to improve on in the future:

- Add twitter OAuth login and tweet run notifications
- Identify opportunities to optimize our postgres queries with eager loading
- Implement a 'run search' feature for users
- Utilize caching strategically to speed-up site performance
- Fine tune the responsive media-query breakpoints


===

Last Updated: Spring 2013


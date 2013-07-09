![WHO RUN IT](http://i.minus.com/iFQ6RJ7jHO4LB.png "WHO RUN IT")

> WHO RUN IT is a disributed, social running club for the web.

**Created by:**

- Mark Morris [@blurredbits](http://www.twitter.com/blurredbits) - [Github]("https://github.com/blurredbits") - <mmorris00@mac.com>
- Matt Hoover [@mthoover1](http://www.twitter.com/mthoover1) [Github]("https://github.com/blurredbits") - <mthoover1@gmail.com>
- Jeff Belser [@JustAboutJeff](http://www.twitter.com/justaboutjeff) [Github]("https://github.com/JustAboutJeff") - <JustAboutJeff@gmail.com>

##About
===

 ...


##Install
===

- Fork the repo and clone the files onto your local machine:

    	$ git clone https://github.com/JustAboutJeff/who_run_it.git

- Navigate to the application directoy in terminal and run **bundle install** to gather the required gems:

    	$ bundle install

- Depending on your local development environment, you may need to create and save out a **.ruby-gemset** and/or **.ruby-version* dot file(s) within the main application directory.

- Within the app's config directory open the **local_env.yaml.sample** file and define the environment variables for your local configuration. Save a new copy as **local_env.yaml**. Check the config/environments directory to view the settings these environment variables control:

    	GOOGLE_MAPS_KEY:   'insert key for (DEV/TEST/PROD)'
    	GMAIL_USERNAME:    'insert username for (DEV/TEST)'
    	GMAIL_PASSWORD:    'insert password for (DEV/TEST)'
    	SENDGRID_USERNAME: 'insert username for (PROD)'
    	SENDGRID_PASSWORD: 'insert password for (PROD)'

- Run the rake commands to create, migrate and seed a postgres db:

    	$ rake db:create && rake db:migrate && rake db:seed

- Launch the application server:

		$ rails s

- Open a broswer and navigate to **localhost:3000**

- Enjoy

##Usage
===

Please consult the production version of the app hosted on heroku for a live demonstration:

<http://whorunit.herokuapp.com>

##Design
===

 ...


##Testing
===
 ...

===

Last Updated: Spring 2013





--------------------
# PageObject Model
 
### Software Requirements 
Latest and greatest ruby version
Latest and greatest Rubymine version
Latest and greatest cucumber


### Gem Dependencies

```bash
gem 'appium_lib', '~> 10.5'
gem 'cucumber'
gem 'rake'
gem 'require_all'
gem 'rspec'
gem 'selenium-webdriver', '~> 3.142', '>= 3.142.7'
gem 'pry'
gem 'nokogiri'
gem 'chunky_png'
gem 'data_magic'
gem 'yard-cucumber'
gem 'redcarpet'
gem 'page_navigation'
gem 'appium_console'
gem 'debase'
gem 'spreadsheet'
gem 'sauce_whisk'
gem 'childprocess'
gem 'parallel_tests'
gem 'eyes_appium'
gem 'test_object_test_result_watcher'
gem 'report_builder', '~> 1.8'
gem 'slackr'
```

### Setup Instructions

Run bundle install 
  
````ruby
run 'bundle install'
````

Run bundle update

````ruby
run 'bundle update'
````
 
### Creating a Test

First create your Feature File by creating it within the folder:

  ````ruby
 features
 ````

Then, identify the app object elements and add to file according to element:
  ````ruby
 object_repository.rb
 ````
  
Then create the methods for the object elements:
* Create a .rb file under the 'screens' folder with naming convention <name_screen.rb> 
* Create the class file with naming convention < NameScreen >
* Within screens class file, include screen-object module, by extending and including the below: 
 
 ````ruby
  extend ObjectRepo
  include ScreenObject
````

After including the screen-object module, numerous methods will be added for your class, with ability to define the elements.
You can also view all the available methods for all elements via: 

 ````ruby
  accessors.rb
````

Once that is done, implement the step definitions by creating a .rb file with the naming convention < name_steps.rb >


### Test Example
 

For the login page you might design your test in the following way:

Calling the text_field and button methods. To login, we could simply write the following code:


````ruby
class LoginScreen

    include screen-object
    # This will add several methods to our page object that allow us to interact with the items on the screen.

        text_field(:username, "name~username”)
        text_field(:password, "name~password”)
        button(:login, "name~login”)

        def enter_username(username)
            self.username = username
        end

        def enter_password(password)
            self. password = password
        end

        def click_login_button
            login
        end

    end
````

Now , you can call those methods into actual step_definition file

````ruby
    on(LoginScreen).enter_username(“testuser”)
    on(LoginScreen).enter_password(“secrect”)
    on(LoginScreen).click_login_button
````
### Running a test
Use the following RakeFile Task command to run the appropriate test details

Check all the available rake tasks
````ruby
    rake -T
````

Once you choose the proper rake file command, pass the profile defined in the cucumber.yml file to the rake tasks

````ruby
    rake run[default]
````

To run a single test, tag the scenario or feature file with @inprogress, then run:
````ruby
    rake run[inprogress]
````

To run the entire regression suite:
````ruby
    rake regression
````

To capture the baseline or run a single applitools test, tag the scenario or feature file with @baseline, then run:
````ruby
    rake baseline_applitools
````

If you have a zsh terminal, then you need to run the script as

````ruby
    rake run\[default\]
````

### Running a test on local machine with real device (Only Android for Now)

Download .APK file to your local machine

Open the following file:
````ruby
    appium.txt
````
Provide the following capabilities. Take note to update the capabilities according to your need.

Example:
````ruby
    [caps]
    deviceName = 'V35 ThinQ'
    deviceOrientation = 'portrait'
    platformVersion = '8.0.0'
    platformName = 'android'
    app = 'path_to_apk'
    appPackage = 'com.bleacherreport.android.teamstream'
    appActivity = 'com.bleacherreport.android.teamstream.TsLaunchActivity'
    appWaitActivity = 'com.bleacherreport.android.teamstream.onboarding.WelcomeActivity'
    noReset = 'false'
    skipDeviceInitialization = 'true'
    newCommandTimeout = 30
```` 
From Terminal, open the appium server by running command
````ruby
    appium
````
Appium is running when the confirmation looks like this: 
````ruby
    [Appium] Welcome to Appium v1.7.2
    [Appium] Appium REST http interface listener started on 0.0.0.0:4723
````
Tag your feature file or scenario with your chosen tag then run the following command from your repo:
````ruby
    cucumber -t @<tag>
````
### Important Files to Consider
The heart and support for this framework can be found in the following files:
````ruby
    /test_data.rb
    /test_data.yml
    /cucumber.yml
    /rakefile(.)
    /driver.rb
    /env.rb
    /saucelabs.rb
````
### ScreenObjects Framework RoadMap
1. Add collection methods
2. Wiki documentation page
3. Add device specific methods to the accessors
4. Make the gem tool agnostic and support other tools based on demand
5. Update to the latest and greatest ruby code 
6. Add additional functions for page-navigation
7. Currently no slack support

### Additional details found in Wiki

# Home Away Automation Exercise part 1

### Objective:
  Write a suite of three automated browser tests for http://store.demoqa.com

  
### Prerequisites:
  In order to run this test, you will need the following prerequisites:
   * a computer connected to the Internet
   * a browser installed on that computer

### Setup:
#### Verify Git, Ruby, RubyGems, and Bundler are installed on your system
  Open a console window and run the following commands to see if your
  environment has the basic Ruby runtime environment configured

    git --version
    ruby --version
    gem --version
    bundler --version
   
  If any of the previous commands fails to return version information, please
  install the missing command executable.
 
  In the next step you will get a copy of the test code. To make this copy,
  you will need a browser installed on your computer.
 
#### Fork and then Clone the Test Code Repository
  In order to run the test, you need a copy of the test code on your computer.
  To create that copy you need to <a href="https://help.github.com/articles/fork-a-repo/" target=_break><i>fork</i></a> and then <a href="https://help.github.com/articles/cloning-a-repository/" target=_break><i>clone</i></a> my code
  from GitHub.
 
##### <i>Please Note: You need a GitHub account to complete this step.</i>
  If you do not have a GitHub account, please take a minute to visit
  http://www.github.com and <a href="https://help.github.com/articles/signing-up-for-a-new-github-account/" target=_break>create an account.</a>

  Once you have a GitHub account, open a browser, navigate to GitHub, and
  login to your GitHub account. Once you are logged into your GitHub account,
  please navigate to GitHub repository with my test code: https://github.com/agodwin/ha-exercise-one
     
  In the top right corner of the page, click the <b>Fork</b> button. Now, you
  have a <i>fork</i> of the original <i>agodwin/ha-exercise-two</i> repository
  in your GitHub account.
 
  Still using the browser, and logged into your GitHub account, navigate to
  your fork of the <i>ha-exercise-one</i> repository. On your fork's
  repository page, locate and copy the clone URL for your fork.

  We are almost done, just a few more steps and you will have a copy
  of my test code.
 
  Return to the the same console window, or opening a new console, and
  <i>clone</i> the test repository from your GitHub account to you local
  computer. You <i>clone</i> the repository on your system with the
  following command (replace YOUR-USERNAME with your GitHub user name):
 
    git clone https://github.com/YOUR-USERNAME/ha-exercise-one.git
   
#### Update Ruby Gems
  Okay, now that we have the test code on your local computer, we are ready
  to run the test.
 
  Using the same console window, or opening a new console, please change
  into the new directory and update your Ruby gems by running the following
  commands:
 
    cd ha-exercise-one/
    bundle install

   
### Run Test: 
  Once you have updated your Ruby gems, we are ready to run the tests.
 
  Using the same console window, or opening a new console, you can run
  the tests with the following commands:

     bundle exec rspec spec/submit_order_spec.rb --format doc

    
### Expected Results: 
  Once each test has completed, your console window should show the following
  results: 
  TBD
 
  If you did not get these results, then please let me know. I need this
  job, so I will need to fix any bugs which I wrote! 



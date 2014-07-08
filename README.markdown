# Wordpress on Engine Yard Cloud

Have you wanted to get Wordpress installed on Engine Yard Cloud?  Well we have something in common then!

## Installation Procedure

### Step 1. Fork this Repository

Click on Fork in the top right of this page, and chose your destination account or organzation to add the repository.

This is important so you'll gain read/write access to the repository, to make your own changes, and be able to add a deploy key in the administration section in Step 3.

Leave the github page open in a tab, since we will be using it throughout this process, and then open the [cloud dashboard](https://cloud.engineyard.com) to continue.

### Step 2. Add an Application 

Now that you've got the repository forked we'll switch over to the Engine Yard dashboard and add an Application so that we'll be able to create an Environment later.

  1. From the homepage, click on the **Add an Application** button at the top of your Environments list.
  2. Choose the **Application Language** of PHP.
  3. Copy and paste your **Git Repository URI**, you just forked in Step 1.
  4. Give the Application Name of "**wordpress**".
  5. Leave the **Web Root** as "public/"
  6. Click on **Create Application** to save the settings of this new Application.

### Step 3. Add the Deploy Key

Engine Yard Cloud generates a ssh key for secure deploys over SSH that don't prompt you for a password.  But this does require a manual step on your part to post the generated key to your repository.

  0. Copy the generated key from the dashboard.
  1. On your Github Repo page, look for **Setting's** on the right side.
  2. Then click on **Deploy Keys** under the left hand side.
  3. Click on **Add deploy key**.
  4. Give it a Title like "**EY Cloud Wordpress**".  
  5. Then paste in the **Key**, and click on the **Add key** button.
  6. You'll be prompted for your Github password, put that in here.
  6. Then switch back to the Engine Yard Cloud, and click on the **My Deploy Key is in Place** button.

### Step 4. Create a New Environment

After you've setup your deploy key, the cloud dashboard will take you right to a page to create a new Environment for your wordpress Application.

We're not going to go over every single option in the new environment page, if you have questions about an option click on the question mark next to the option for more information.  We'll give the most important things to change in this list.

  1. Give your Environment a name, I chose "**blog**".
  2. **PHP Environment** should match your needs, production / staging, etc.
  3. **Application Server Stack** is a drop down that has more options in other languages.  PHP-FPM is great for our needs.
  4. Choose the latest **Stack** of "stable-v4 2.0" so you'll get the best stack and updates we have to offer.
  5. Wordpress works best on "MySQL 5.5.x", please choose this for your **Database Stack**.
  6. When you've completed setting up your Environment, click **Create Environment** to save it.  

NOTE: You can always come back and make changes to many of the settings of an Environment while the system is running.  Some will require the server to be turned off and will grey out to indicate this.

### Step 5. Boot Your Environment

Your next possible step is to boot up your newly created environment settings (which have an application configured inside it.)  If you want you can do this now.  Otherwise you can stop here and come back to this poing at any time by finding your environment and click on the "Boot" button.

  1. Click on Custom Configuration.
  3. In order to setup your DNS later, you'll need to use an IP address.  So make sure to choose **Add IP Address** from the *External Address* drop-down, if it's not already there.
  2. Change the Number of instances to add to 1.
  3. In the **Instance Size** choose the "Compute Optimized (C1) Medium" also knownn as High CPU Medium 64 bit.
  4. **Uncheck the box** that says "Use separate database instance" so you'll simplify and use just a single server.
  4. Click **Boot This Configuration** to start the server.

### Step 6. Meanwhile Back at the CLI

While that environment boots, let's get some other things setup.  In order to complete the installation, you'll need to install the `engineyard` rubygem.

`sudo gem install engineyard`

You also need to have your repository checked out to your local machine, so we can run a couple of commands to upload and run custom chef recipes on your environment.

  * Open your code directory.

`cd ~/code`

  * Run the git command to clone the repository locally.  **USE YOUR REPO**

`git clone git@github.com:<username>/wordpress.git`

  * Now move into that folder so we can upload the chef recipes.

`cd ~/code/wordpress`

`ey recipes upload`

  * This command will prompt you for your username and password (unless you've used this before).  Enter the same user/pass you use to login to Engine Yard Cloud.
  * Then we'll run the custom chef recipes from the CLI to finish it off.

`ey recipes apply`

  * Now log back into EY Cloud and to deploy your app in Step 8.

### Step 7. Deploy Your Application & Run Chef

  1. In the Dashboard, click on the **Applications** tab for your environment.
  2. Click on the **Deploy** link there.

### Step 8. Open Your Wordpress Blog

  1. Now you're ready to click on the **HTTP** link in your environment.
  2. You can start to setup your Wordpress blog.  Enjoy!

## Explanation of Non-Wordpress Files

    README.markdown  |  You're reading it sonny-jim.
    Rakefile         |  Tasks to create a cookbook or test for syntax errors.
    cookbooks/       |  The custom chef recipes folder.
    deploy/          |  This folder allows for EY Cloud deploy hooks.
    public/          |  Contains the main wordpress software, and is the Web Root.

Read the code in the files for more information.  The rest of the files are needed to run Wordpress.

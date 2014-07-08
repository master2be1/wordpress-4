# Wordpress on Engine Yard Cloud

Have you wanted to get Wordpress installed on Engine Yard Cloud?  Well we have something in common then!

## Installation Procedure

### Step 1. Fork this Repository

Click on Fork in the top right of this page, and chose your destination account or organzation to add the repository.

This is important so you'll gain read/write access to the repository, to make your own changes, and be able to add a deploy key in the administration section in Step 3.

### Step 2. Add an Application 

Now that you've got the repository forked we'll switch over to the Engine Yard dashboard and add an Application so that we'll be able to create an Environment later.

  1. From the homepage, click on the **Add an Application** button at the top of your Environments list.
  2. Choose the **Application Language** of PHP.
  4. Copy and paste your **Git Repository URI**, you just forked in Step 1.
  3. Give the Application Name of "**wordpress**".
  6. Leave the **Web Root** as "public/"
  6. Click on **Create Application** to save the settings of this new Application.

### Step 3. Add Your Git Deploy Key to Your Repository's Deploy Key

  1. On your repository's page click on the **Admin** button.
  2. Then click on **Deploy Keys** under the left hand side.
  3. Click on **Add another deploy key**.
  4. Give it a Title like "**EY Cloud**".
  5. Then paste in the **Key**, and click on the **Add key** button.
  6. Then switch back to EY Cloud and click on the **My Deploy Key is in Place** button.
  7. There are no extra Gems to setup, click the **Next Step** button to proceed to Step 4.

### Step 4. Configure Unix Packages

  1. Enter "**dev-lang/php**" in the search.
  2. Click the **Add ->** button to add PHP to the wordpress application.
  3. Enter "**lighttpd**" in the search.
  4. Click on **Add ->** button so we get the fcgi processes from the lighttpd package.
  5. Now we're done configuring the Unix Packages so click on **Go to dashboard**.

### Step 5. Create a New Environment

  1. From the Dashboard, click on the **Create New Environment** button.
  2. Give your Environment a name, I choose "**blog**".
  3. The rest of the default options are fine, click "**Create environment**" to save the settings.
  4. You then need to choose which Application to add to your Environment.  Choose the **wordpress** application we configured in Steps 2 - 4, by clicking on the "**Add to blog**" button.
  5. The **Choose a Domain Name** dialog appears.  Just click **Save domain name** to proceed.

### Step 6. Boot Your Environment

  1. Click on the **Boot Instances** button for your Environment.
  2. The default instance size is a High CPU Medium.  If this is more than you need, you can click on **Custom** and choose **Small** from the *Server size* drop-down list.
  3. In order to setup your DNS later, you'll need to use an IP address.  So make sure to choose **Add IP Address** from the *External Address* drop-down.
  4. Click **Boot This Configuration** to start the instance.

### Step 7. Meanwhile Back at the CLI

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

### Step 8. Deploy Your Application & Run Chef

  1. In the Dashboard, click on the **Applications** tab for your environment.
  2. Click on the **Deploy** link there.

### Step 9. Open Your Wordpress Blog

  1. Now you're ready to click on the **HTTP** link in your environment.
  2. You can start to setup your Wordpress blog.  Enjoy!

## Explanation of Non-Wordpress Files

    README.markdown  |  You're reading it sonny-jim.
    Rakefile         |  Tasks to create a cookbook or test for syntax errors.
    cookbooks/       |  The custom chef recipes folder.
    deploy/          |  This folder allows for EY Cloud deploy hooks.

Read the code in the files for more information.  The rest of the files are needed to run Wordpress.

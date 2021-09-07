# Solar2D Android Build Automation

Automate building of Solar2D Android projects with GitHub Actions.

## Preparing the repo

1. Log in to [GitHub](http://github.com/) and press the ➕ button in the top right corner, then select "Import repository". We import the repository instead of forking it so that there's an option to set your repository to private. GitHub forks of public repositories can only be set to public. [⏯](https://i.imgur.com/btddTj3.gif)
2. Paste the clone URL: `https://github.com/solar2d/demo-android-automation.git`, pick a name for your repository, (e.g. "Solar2Demo"), and choose a visibility. This particular project does not contain any unencrypted sensitive information but if you plan to extend it, make it private. You can change the visibility later.
3. Clone newly created repository and do the following:
    1. Replace contents of `Project` directory with project you want built
    2. Edit first two lines of `Util\recipe.lua` replacing values with your application name and app package
    3. Replace `Util\android.keystore` with desired keystore

   Commit and push all the changes.
4. In your repo press "⚙ Settings" in the menu bar and pick "Secrets" in the sidebar.
5. Press "<a name="secret-create">New Repository Secret</a>" and type the following Name and Value pairs into their corresponding fields, clicking "Add secret" for each. [⏯](https://i.imgur.com/yLcgLO6.gif):
    1. Name: `keystorePassword`</br>
       Value: Password for your keystore
    2. Name: `keystoreAlias`</br>
       Value: Keystore key alias name. If you don't know where to get it, see Hits below.
    3. Name: `aliasPassword`</br>
       Value: Password for the keystore key specified by alias

## Building the App

1. Navigate to your repo at GitHub website and select "Actions" tab
2. Select "Build Android App" in the workflows sidebar.
3. Select "Run Workflow", edit parameters as requeired and press the Run button
4. Workflow would start. When it will finish you would be able to download `AndroidBuild` artifact from its page

### Hits

To list Keystore entries you can use several methods. You can use the Simulator, and check the build window. Or you can use the command line tool provided by Java. It is also embedded in Simulator:

```bash
/Applications/Corona-3653/Corona\ Simulator.app/Contents/jre/jdk/Contents/Home/bin/keytool -list -keystore Util/android.keystore
```

Windows would have same tool at the installation location of Solar2D.

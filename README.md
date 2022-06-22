# ProHealth360

## Project setup

### Project prerequisites

1. The **ProHealth360** app runs on Flutter version 2.5.3. To check the flutter version and channel installed in your machine run `flutter --version`.

2. To switch from another channel of Flutter to the stable channel run `flutter channel stable`.

3. To install Flutter version 2.5.3 run `flutter version v2.5.3`.

Looks like we are done with the prerequisites :-)

### Implementation decision

This app is locked in portrait mode. Data shows that majority of our users will be accessing it via portrait mode hence
spending time and resources making it work in both `portrait` and `landscape` is an overkill.

To dig into the data. go to [Stat Counter](https://gs.statcounter.com/screen-resolution-stats/mobile-tablet/kenya/#monthly-201806-202103)

Examples of apps serving the Kenyan market and doing well with portrait lock are Mpesa and Bolt.

### How to setup and run myafyahub

1. Use `git clone git@github.com:savannahghi/myafyahub.git` to clone this project.

2. Navigate into the project directory.

3. Run `. set_up.sh` or `source set_up.sh`. This helps prevent you from pushing code that has linting errors.

4. Easy, just run

```sh
    flutter run
```

- Optionally, if you love using VS Code debugging tools, you can add this in your `launch.json`

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Dev mode",
      "request": "launch",
      "flutterMode": "debug",
      "type": "dart",
      "program": "lib/main.dart"
    },
    {
      "name": "Release mode",
      "request": "launch",
      "flutterMode": "release",
      "type": "dart",
      "program": "lib/main_prod.dart"
    }
  ]
}
```

**To run the app(with dev and prod configurations/flavors) on iOS**

run this on your terminal for the dev config

```sh
    flutter run -t lib/main.dart --flavor dev
```

and this for the prod config

```sh
    flutter run -t lib/bin/main_prod.dart --flavor prod
```

- Again, optionally, if you love using VS Code debugging tools, you can add this in your `launch.json`

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Flutter Dev",
      "request": "launch",
      "flutterMode": "debug",
      "type": "dart",
      "program": "lib/main.dart",
      "args": ["--flavor", "dev"]
    },
    {
      "name": "Flutter Release",
      "request": "launch",
      "flutterMode": "release",
      "type": "dart",
      "program": "lib/bin/main_prod.dart",
      "args": ["--flavor", "prod"]
    }
  ]
}
```

1. Next, you need to complete local keystore setup. For more information, visit [app signing](git@github.com:savannahghi/myafyahub.githttps://developer.android.com/studio/publish/app-signing) in the Android Developers blog

2. Run your emulator. See instructions on how to [run an emulator](https://flutter.dev/docs/get-started/install/linux#set-up-the-android-emulator).

3. Finally run the project running `flutter run` command on your terminal, or go to `Run > Start Debugging` if you wish to run the app from VS code.

## How to setup and run unit, widget and integration tests locally

### Unit Tests

To run unit and widget tests, you will require to install `lcov` by running `sudo apt-get install lcov` in the terminal. Finally, run the following commands in the terminal:

1. From the root folder, run `flutter test --coverage test/`

2. Run `genhtml -o coverage coverage/lcov.info`. This will generate a `html` file which contains your coverage information.

3. To view the coverage information, open the html file located at `coverage/index.html` with your favorite browser.

### Integration tests

To run integration tests, ensure that you have an emulator running. See instructions on how to [run an emulator](https://flutter.dev/docs/get-started/install/linux#set-up-the-android-emulator).

1. Then run `flutter drive --target=test_driver/app.dart`

### Environment variables

In order for you to run the application locally on your machine, you will need the following environment variables

1. PROD_SENTRY_DNS and DEV_SENTRY_DNS that will be used to send error messages to your Sentry error reporting server
2. DEV_STREAM_API_KEY, DEMO_STREAM_API_KEY and PROD_STREAM_API_KEY that will be used to enable you to connect to the GetStream API

If you want to add an environment variable to CI, you will need to run the following command to encode the ENV file into a string format. The `--b 0` will prevent the new lines from being encoded

```bash
base64 --b 0 --i .env
```

In the CI configuration, you can decode the string into the ENV variable using this command which will decode the string into the ENV file

```bash
echo $ENCODED_APP_ENV | base64 --decode > .env
```

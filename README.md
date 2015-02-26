Checks web service for continuous deployment flags per environment and application name.

## Options

* `endpoint` - root url for environment/application http calls
* `environment` - name of environment (e.g. `production`)
* `application` - name of application

## Example

``` yaml
build:
  steps:
    - userminddeployer/cd-gate:
        endpoint: http://bucket.s3.amazonaws.com/cd
        environment: production
        application: website

```

## Deploying

To update this for consumers of the Wercker step, you'll need to manually
deploy it to the Wercker directory using the `registry` target. See
[Publishing your own step](http://devcenter.wercker.com/articles/directory/).

## Changelog

### 0.0.4

- Add aliases for production and staging.

### 0.0.3

- Default to off.

### 0.0.2

- Initial release.

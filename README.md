Checks web service for continuous deployment flags per environment and application name.

## Options

* `endpoint` - root url for environment/application http calls
* `environment` - name of environment (e.g. `production`)
* `application` - name of application

## Example

``` yaml
build:
  steps:
    - cd-gate:
      endpoint: http://bucket.s3.amazonaws.com/cd
      environment: staging
      application: website
```

## Changelog

### 0.0.1
 - Initial release.

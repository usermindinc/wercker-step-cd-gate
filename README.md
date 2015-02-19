Checks web service for continuous deployment flags per environment and service name.

## Options

* `endpoint` - root url for environment/service http calls
* `environment` - name of environment (e.g. `production`)
* `service` - name of service

## Example

``` yaml
build:
  steps:
    - cd-gate:
      endpoint: http://bucket.s3.amazonaws.com/cd
      environment: staging
      service: website
```

## Changelog

### 0.0.1
 - Initial release.

___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "WebwinkelKeur",
  "categories": ["MARKETING"],
  "brand": {
    "id": "brand_dummy",
    "displayName": "Custom Template"
  },
  "description": "The WebwinkelKeur tag installs the WebwinkelKeur Sidebar on your site. Using the sidebar, your visitors can see your WebwinkelKeur status and reviews at a glance.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "Shop ID",
    "displayName": "Shop ID",
    "simpleValueType": true,
    "help": "Get the Shop ID from the Installation page in the WebwinkelKeur dashboard.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "POSITIVE_NUMBER"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const encodeUriComponent = require('encodeUriComponent');
const getTimestampMillis = require('getTimestampMillis');
const makeInteger = require('makeInteger');
const Math = require('Math');
const logToConsole = require('logToConsole');

const id = makeInteger(data['Shop ID']);
const url = 'https://dashboard.webwinkelkeur.nl/sidebar.js?id=' + encodeUriComponent(id) + '&c=' + cachebuster(10, id);

injectScript(url);

data.gtmOnSuccess();

function cachebuster(refreshMinutes, id) {
    var now = getTimestampMillis();
    var interval = refreshMinutes * 60 * 1000;
    var shift = ((id * 2654435769) % 40503)/40503 * interval;
    return Math.floor((now + shift) / interval);
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://dashboard.webwinkelkeur.nl/"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Test
  code: |-
    const mockData = {
      "Shop ID": 1201440,
    };

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertApi('gtmOnSuccess').wasCalled();


___NOTES___

Created on 4/27/2022, 8:14:05 PM



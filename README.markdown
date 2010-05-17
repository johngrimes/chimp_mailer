# ChimpMailer

Currently a thin wrapper around the MailChimp API.

Will eventually be expanded to integrate into Rails in many awesome ways.

## Installation

`gem install chimp_mailer`

## Example

In your environment.rb:

`MailChimp.settings = { :api_key => 'YOUR API KEY HERE' }`

Then you can call any MailChimp API method like so:

`MailChimp.campaign_schedule(:cid => 'afd3245', :schedule_time => '2010-06-21 12:30:00')`

---

Copyright (c) 2010 Small Spark Pty Ltd, released under the MIT license

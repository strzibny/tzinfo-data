===== Aim ======

Make ruby-tzinfo read timezone data preferably from system-wide zoneinfo tzdata files. If zoneinfo is not present on the system, read data from tzinfo-data (this separated gem).

More on this: http://rubyforge.org/tracker/index.php?func=detail&aid=29620&group_id=894&atid=3525

= TZInfo-Data -- Cross-platform database for timezone library tzinfo

TZInfo-Data[http://tzinfo-data.rubyforge.org] uses the tz database
(http://www.twinsun.com/tz/tz-link.htm) to provide daylight-savings
aware transformations between times in different timezones for tzinfo.

The tz database has been imported (using TZDataParser) and turned into a set of
Ruby modules (which are packaged with this release).

== Example usage

This database (once installed) will be used automatically with tzinfo library
if zoneinfo database is not installed on your machine. This shouldn't be necessary
on UNIX-like machines that usually come with preinstalled zoneinfo.

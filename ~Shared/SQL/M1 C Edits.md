# Edit Code ‘C’

DEPI:
>Edit Code C is used for only updating the parcel based Council Reference number (Crefno). This edit code can be used 
to populate or null a Crefno.

Comparing Vicmap Parcel against Council Parcel based on a common `spi`:

* where Vicmap `crefno` is null and the Council `crefno` is populated, then update with the *first* Council `crefno` value

Looking at all Vicmap Parcels:

* where Vicmap `crefno` value doesn't exist in Council Parcel and...
  * there exists an alternative Council `crefno` value for that parcel, then update with the *first* Council `crefno` value
  * there is no Council `crefno` value for that parcel, then null the `crefno`

## Q&A with DEPI

If more than one C edit record is supplied for a single parcel, will any of them succeed (or will they all fail)?

> If the details are the same, the first one will be loaded and the second tagged as a duplicate otherwise all records will fail to be loaded.

## Development notes:

* so far only implemented Scenario 2
* still to implement _first only_ rule
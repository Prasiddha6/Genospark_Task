# Database Architecture

## Main tables

- `cloud_categories`: cloud service categories and provider mappings.
- `cloud_services`: canonical cloud service catalog.
- `challenge_services`: difficulty-based challenge records and options.

## Provider IDs

- AWS: 1
- Azure: 2
- Google Cloud: 3

## Environment

The internship database work described here targets `emsdb_test`.
Verify the active connection before executing SQL.

## [Unreleased]
*no unreleased changes*

## 4.0.1 / 2019-10-29
### Fixed
* Relax `chronic` dependency

## 4.0.0 / 2019-09-06
### Changed
* Added case filters for delivery and booking postcode fields and removed all simple postcode field filters (#36)

### Added
* Added fasp and fasp plus code groups (#37)

## 3.0.0 / 2019-06-04
### Changed
* Added new branch of CANQL for querying all patient not just child patients - modifies DIR (#29)

## 2.10.0 / 2019-05-29
### Added
* Add filter for processing region (#32)

## 2.9.0 / 2019-05-14
### Added
* Add filter for processing date for unprocessed records (#28)

## 2.8.0 / 2019-04-09
### Added
* Added filtering by anomaly screening status (#25)
* Added anomaly screening status to field existance list (#26)

## 2.7.0 / 2019-03-21
### Added
* Added support for NIPT, RD_DEATH and UMUM batch types (#23)

## 2.6.0 / 2019-03-12
### Added
* Added the ability to limit cases to primary or alias patients (#20)
* Added support for ENOTE2, BADGER and UCYTO batched types (#21)

## 2.5.0 / 2019-01-25
### Added
* Added the abiltity to filter actions by trust as well as hospital (#18)
* Added the abiltity to filter cases by booking and delivery hospital & trust (#18)
### Fixed
* Support Ruby 2.6 - minimum is now 2.4

## 2.4.0 / 2018-07-19
### Added
* add ability to filter by genetic tests (#17)

## 2.3.0 / 2018-06-08
### Added
* Added action and ebr clauses for mother patients (#16)

## 2.2.0 / 2018-06-05
### Added
* Added EDD and booking hospital to missing and populated field clause (#15)

# Tollfree Parser

Simple tollfree number parser to generate possible words for a given number, matching a predefined dictionary and keyboard layout map.

### Assumptions

* Input number will be of 7 digits and contains only (+ve) digits
* Dictionary and keyboard map contains only alphabets
* Dictionary data is seeded in file - 'data/dictionary.json' and isn't empty
* Dictionary words are in upper case
* Input number can map to either of
  * A complete word in dictionary
  * Set of words or repetitive words in dictionary
  * Set of words with one number in-between them

## Installation

Requires ruby 2.4.x to be installed

Run from project root:

```
./bin/setup

```

Will install dependency gems AND run tests

## Usage

Execute (from project root):

    $ ./bin/console


```ruby
> TollfreeParser.run(2255263)
["CALL2ME"]

> TollfreeParser.run(2255)
["CALL"]

> TollfreeParser.run(2226453)
[]

```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

# ActsAsPreviousNext

[![Build Status](https://travis-ci.org/chief/acts_as_previous_next.png?branch=master)](https://travis-ci.org/chief/acts_as_previous_next)
[![Code Climate](https://codeclimate.com/github/chief/acts_as_previous_next.png)](https://codeclimate.com/github/chief/acts_as_previous_next)
[![Gem Version](https://badge.fury.io/rb/acts_as_previous_next.png)](http://badge.fury.io/rb/acts_as_previous_next)
[![Dependency Status](https://gemnasium.com/chief/acts_as_previous_next.png)](https://gemnasium.com/chief/acts_as_previous_next)

## Description

This `acts_as` extension provides the capability for having previous & next methods
for an object. Previous & next are based on a specified column (default is id).

## Install

* Rails >= 3

  In your Gemfile

    `gem 'acts_as_previous_next'`

  Currently is tested on ruby 1.9.3 & 2.0.0 and mysql

## Example

```ruby
  class Post < ActiveRecord::Base
    acts_as_previous_next
    # acts_as_previous_next column: :id
    # or
    # acts_as_previous_next :id
  end

  post = Post.new
  post.next # => nil
  post.save
  post.next # => post
  post.previous # => post
  another_post = Post.new
  another_post.save
  another_post.next # => post
  another_post.previous # => post
```

## Authorization support

Currently [CanCan](https://github.com/ryanb/cancan) authorization is supported
as option (`false` by default). If cancan authorization is enabled then `current_ability`
must be passed to `previous` `next` methods. So the previous example with cancan:

```ruby
  class Post < ActiveRecord::Base
    acts_as_previous_next with_cancan: true

    belongs_to :user
  end
```

And in your view:

```ruby
  link_to 'Next', @post.next(current_ability)
  link_to 'Previous', @post.previous(current_ability)
```

## License

acts_as_previous_next is released under the [MIT License](http://opensource.org/licenses/MIT)


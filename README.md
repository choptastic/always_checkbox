# always_checkbox

Normal HTML checkboxes only submit their value when they are checked, but
sometimes you *want* a value to be submitted even if the box is unchecked.
This offers an alternative that will submit a value depending on the checked
status, customizable with `yes_value` and `no_value`.

This creates an `#always_checkbox{}` element for the [Nitrogen Web
Framework](http://nitrogenproject.com)

## Installing into a Nitrogen Application

Add it as a rebar dependency by adding into the deps section of rebar.config:

```erlang
	{always_checkbox, "", {git, "git://github.com/choptastic/always_checkbox.git", {branch, master}}}
```

### Using Nitrogen's built-in plugin installer (Requires Nitrogen 2.2.0)

Run `make` in your Application. The rest should be automatic.

### Manual Installation (Nitrogen Pre-2.2.0)

Run the following at the command line:

```shell
	./rebar get-deps
	./rebar compile
```

Then add the following includes into any module requiring the form

```erlang
	-include_lib("always_checkbox/include/records.hrl").
```

## Usage

```erlang
	#always_checkbox{
		yes_value="Yes it's checked",
		no_value="Not checked",
		checked=true
	}.	
```

## License

Copyright (c) 2014, [Jesse Gumm](http://sigma-star.com/page/jesse)
([@jessegumm](http://twitter.com/jessegumm))

MIT License

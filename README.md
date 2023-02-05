# AutoLayoutHelpers

A small set of utilities to sand over the autolayout APIs most commonly encountered rough edges. There's several
distinct but related sets of utilities within.

## Constraint Extensions

Manipulating constraints especially when setting them up is not always as smooth a developer experience as it could be.
While mostly syntactic sugar, the `@inlinable` utilities offered here allow for simpler to write yet no less readable
code to set up constraints.

## Constraint Builders

Much gnashing of teeth happens every time someone is building UI in code and they have to align a subview against its
superview edges. **No More**. Just use the utilities within to generate all the constraints at once, or whatever subset
of them make sense for your needs. Then use the constraint utilities or the property wrappers to activate them.

Keep in mind that the utilities have been built to deal with the cases where using the regular API is more painful than
needed. If you're looking for something here and don't see it chances are we determined that the layout anchor API does
a fine enough job on its own.  

## Property Wrappers

Layout changes in an autolayout world are done by either adding and removing constraints or by tweaking existing ones
properties (either `constant` or `priority`). In either case there's a need to keep a reference to those constraints
beyond their automatic management by the framework.

A pair of property wrappers, `ActiveConstraint` (for a single constraint) and `@ActiveConstraints` (for an array of
constraints) are offered that will ensure that any constraint placed within them is activated, and any constraint that
 is no removed from them is deactivated. This smoothes out constraint changes when the UI requires them.

## `translatesAutoResizingMaskIntoConstraints` Management

It's a superview's responsibility to manage a subview's `translatesAutoResizingMaskIntoConstraints` flag and all newer
container APIs do as much (i.e. `UIStackView.addArrangedSubview` & friends). However, for historical reasons, the
original view tree management APIs don't touch the flag which leads to bugs as folks forget to manually turn it off.

Assuming that manual layout is an exception in UI logic these days, a set of wrappers for the frameworks' view hierarchy
management are offered. They are distinct per platform as to allow for a 1 to 1 replacement of existing logic.

### Enforcement

Having these utilities available won't help if folks forget to use them. To encourage developers to avoid the old
patterns and use the new ones you can add the following rules to your linter config file:

```
  avoid_manually_disabling_TARMiC:
    regex: 'translatesAutoresizingMaskIntoConstraints = false'
    message: "Do not manually turn translatesAutoresizingMaskIntoConstraints off, use the managed view hierarchy methods add(subview:) and insert(subview:) instead"
    match_kinds: identifier
    
  avoid_addsubview:
    regex: 'addSubview\('
    message: "Do not call `addSubview(...)` directly, use the `add(subview:...)` wrappers instead"
    match_kinds: identifier

  avoid_insertsubview:
    regex: 'insertSubview\('
    message: "Do not call `insertSubview(...)` directly, use the `insert(subview:...)` wrappers instead"
    match_kinds: identifier

```

As with anything other linter rules, they can be momentarily disabled where it makes sense to do so.

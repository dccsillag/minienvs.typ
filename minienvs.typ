// BUG: typst watch sandbox.typ; edit something nontrivial in minienvs.typ (or in sandbox.typ, sometimes); document becomes blank;
// Due to some errors, it looks like!

#let _counter_prefix = "minienvs:"
#let _config = state("minienvs:config", (
  no-numbering: (
    proof: true,
  ),
  transforms: (
    proof: it => [#it $space qed$],
  )
))

#let _recognize(term_content) = {
  let _get_nth_bit(x, i) = {
    if x.has("children") {
      _get_nth_bit(x.children.at(i), i)
    } else {
      x
    }
  }
  let _split_head_tail(x) = {
    if x.has("children") {
      (x.children.at(0), x.children.slice(1, none).join([]))
    } else {
      (x, none)
    }
  }

  let (head, tail) = _split_head_tail(term_content)

  if not head.has("text") {
    return none
  }

  if tail == none {
    return (head.text, none)
  } else {
    (head.text, tail)
  }
}

// TODO hanging indent?
#let _minienv(term, config) = {
  let maybe_recognized = _recognize(term.term)
  if maybe_recognized == none {
    // TODO: just return a plain term, but without falling prey to infinite recursion
    // return term

    return [
      *#{term.term}* _#{term.description}_
    ]
  }
  let (head, tail) = maybe_recognized
  let kind = lower(head)

  let c = counter(_counter_prefix + kind)
  c.step()

  [*#head*]
  if not config.no-numbering.at(kind, default: false) {
    [* #{c.display()}*]
  }
  if tail != none {
    [*#tail*]
  }
  [*.*]

  config.transforms.at(kind, default: it => it)([_#{term.description}_])
}

#let minienvs(doc, config: auto) = {
  if config != auto {
    // FIXME: dict update instead of overwrite
    _config.update(x => config)
  }

  show terms: (ts => _config.display(c => ts.children.map(t => block(_minienv(t, c))).join([])))
  doc
}

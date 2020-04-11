- _Tuples_: fixed "number of pieces" that may have different types
- Tuples can be nested

## Pairs

### Syntax

```sml
(e1, e2)
```

### Evaluation

Evaluate `e1` to `v1` and `e2` to `v2`; result is `(v1, v2)`

### Type-checking

If `e1` has type `ta` and `e2` has type `tb`, then the pair expression has type `ta * tb`

### Access

Syntax: `#1 e` and `#2 e`

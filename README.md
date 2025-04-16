# WGSL/WESL Zed Extension
This extension provides language support for [WGSL](https://gpuweb.github.io/gpuweb/wgsl/), [WESL](https://github.com/wgsl-tooling-wg/wesl-spec) and a best effor support for Bevy ([naga_oil](https://github.com/bevyengine/naga_oil)) extensions.
It uses [wgsl-analyzer](https://github.com/wgsl-analyzer/wgsl-analyzer) for the language server and [tree-sitter-wesl](https://github.com/wgsl-tooling-wg/tree-sitter-wesl) for the tree-sitter grammar.


There already is a Zed extension for WGSL, [wgsl-zed](https://github.com/luan/zed-wgsl), but it uses [glasgow](https://github.com/nolanderc/glasgow) for the LSP and [tree-sitter-wgsl](https://github.com/szebniok/tree-sitter-wgsl) which is outdated and doesn't support WESL.

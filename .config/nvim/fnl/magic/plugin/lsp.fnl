(module magic.plugin.lsp
  {autoload {lspconfig lspconfig
             which-key which-key
             lspsaga lspsaga
             null-ls null-ls}})

;; Setup null-ls as general language server with the follow `sources`
(local sources [null-ls.builtins.formatting.prettier null-ls.builtins.formatting.black])

(null-ls.setup {:sources sources})

;; Setup lspsaga for some LSP enhancements
(lspsaga.init_lsp_saga {
                        :server_filetype_map { :metals       [:sbt :scala] }
                        :code_action_prompt  { :virtual_text false }
                        })

;; Setup diagnostics and capabilities and all that jazz for lspconfig
;; Honestly I have no real idea what all of this _actually_ does.
(local diagnostics {:virtual_text true
                    :signs true
                    :underline true })

(local cap (vim.lsp.protocol.make_client_capabilities))
(tset cap.textDocument.completion.completionItem :snippetSupport true)

(local handlers { :textDocument/publishDiagnostics (vim.lsp.with vim.lsp.diagnostic.on_publish_diagnostics diagnostics )})

(set lspconfig.util.default_config (vim.tbl_extend :force lspconfig.util.default_config {:handlers     handlers
                                                                                         :capabilities cap }))

;; JavaScript and TypeScript
(lspconfig.tsserver.setup { :filetypes { :javascript :typescript :javascriptreact :typescriptreact }})

;; Python
(lspconfig.pyright.setup {})

;; Nim
(lspconfig.nimls.setup {})

;; Nix
(lspconfig.rnix.setup {})

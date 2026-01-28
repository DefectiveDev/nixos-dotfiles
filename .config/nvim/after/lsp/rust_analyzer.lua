return {
    settings = {
        ["rust-analyzer"] = {
            completion = {
                addSemicolonToUnit = false,
                addCallParenthesis = false,
                addCallArgumentSnippets = false
            },
            lens = {
                debug = {
                    enable = true
                },
                enable = true,
                implementations = {
                    enable = true
                },
                references = {
                    adt = {
                        enable = true
                    },
                    enumVariant = {
                        enable = true
                    },
                    method = {
                        enable = true
                    },
                    trait = {
                        enable = true
                    }
                },
                run = {
                    enable = true
                },
                updateTest = {
                    enable = true
                }
            }
        }
    }
}

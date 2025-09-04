#!/bin/sh

# sed --debug '/\\:\\\\{String},/,/^\\:/{/^\\:\\\\{String[^}]/!d}' tmp.tex
# sed "/\\\\:\\\\\\\\{String},/,/^\\\\:/ {/^\\\\:\\\\\\\\{String[^}]/! d}" tmp.tex
# sed --debug '/\\:\\\\{String},/,/\./d' tmp2.tex
function eat {
    # delete everything from "\:\\{<entry>}" to the concluding "."
    sed -i "/\\\\:\\\\\\\\{$1},/,/\\./ d" esmprocessor.tex
}
eat "boolean"
eat "char"
eat "integer"
eat "Pointer"
eat "pointer"
eat "String"
eat "string"
eat "True"
eat "true"
eat "False"
eat "false"
eat "Exit"
eat "exit"
eat "byte"
eat "LongInt"
eat "Longint"
eat "longint"
eat "SizeOf"
eat "virtual"
eat "inherited"

#sed '/\\:\\\\{String},/,/^\\:/{/^\\:\\\\{String[^}]/!d}' esmprocessor.tex
#sed '/\\:\\\\{String},/,/^\\:/{/^\\:/!d}' esmprocessor.tex
#                        
#sed 's/\\:\\\\{String},.*//' tmp.tex
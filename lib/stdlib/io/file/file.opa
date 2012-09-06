/*
    Copyright Â© 2011, 2012 MLstate

    This file is part of Opa.

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import-plugin unix
/**
 * {1 About this module}
 *
 * Be aware that this package access local file
 * and could be inaccessible or not working with some cloud configuration
 *
 * {1 Where should I start?}
 *
 * {1 What if I need more?}
 */

/**
 * {1 Interface}
 */

/**
  * A module for very basic file access
  */
File = {{
  exists = %% BslFile.exists %% : string -> bool
  content = %% BslFile.content %% : string -> binary
  content_opt = %% BslFile.content_opt %% : string -> option(binary)
  is_directory = %% BslFile.is_directory %% : string -> bool
  mimetype =
    #<Ifstatic:OPA_BACKEND_QMLJS>
    _ -> none
    #<Else>
    %% BslFile.mimetype_opt %% : string -> option(string)
    #<End>
  basename = %% BslFile.basename %% : string -> string
  dirname = %% BslFile.dirname %% : string -> string

  readdir(path):outcome(llarray(string),string) =
    (err,r) = Raw.readdir(path)
    if err==""
    then {success=r}
    else {failure=err}


  @private
  Raw = {{
    readdir = %% BslFile.readdir %% : string -> (string,llarray(string))
  }}

}}

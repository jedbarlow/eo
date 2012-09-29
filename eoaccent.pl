#! /usr/bin/perl
# Esperanto x-Digraph to Accent Transformer
#   Convert Esperanto x-conventional digraphs to proper accented unicode code
#   points.  Input can be in UTF-8 encoding, output is always in UTF-8
#
# Example
#   > echo "ankaux" | perl eoaccent.pl
#   ankaŭ
# 
# Integrating with vim
#
#   First, if you haven't already set the map leader, then add the following to
#   your .vimrc file:
#     let mapleader = "m"
#
#   Somewhere later in your .vimrc file, add the following (modify the paths,
#   or put the perl script in the directory shown):
#     map  <Leader>e    :.!~/.vim/eo/eoaccent.pl<CR>
#     map  <Leader>ef   :%!~/.vim/eo/eoaccent.pl<CR>
#     map  <Leader>ep vap:!~/.vim/eo/eoaccent.pl<CR>
#     vmap <Leader>e     :!~/.vim/eo/eoaccent.pl<CR>
#
#   To use, select text in visual mode and type "me" to make accents.
#   Alternatively, in normal mode, type "me" to accent the current line, "mep"
#   for the current paragraph, or "mef" for the whole file.
#
#
# Copyright (C) 2012 Jed Barlow
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

use Encode qw(decode);

binmode(STDOUT, ":encoding(UTF-8)");

while(my $text = <STDIN>) {

    $text =~ s/c[xX]/ĉ/g;
    $text =~ s/C[xX]/Ĉ/g;

    $text =~ s/g[xX]/ĝ/g;
    $text =~ s/G[xX]/Ĝ/g;

    $text =~ s/h[xX]/ĥ/g;
    $text =~ s/H[xX]/Ĥ/g;

    $text =~ s/j[xX]/ĵ/g;
    $text =~ s/J[xX]/Ĵ/g;

    $text =~ s/s[xX]/ŝ/g;
    $text =~ s/S[xX]/Ŝ/g;

    $text =~ s/u[xX]/ŭ/g;
    $text =~ s/U[xX]/Ŭ/g;

    print decode('UTF-8', $text);
}



import pkg_resources
from symspellpy import SymSpell, Verbosity
import sys

dict_file = sys.argv[1]
test_file = sys.argv[2]

sym_spell = SymSpell(max_dictionary_edit_distance=3, prefix_length=7)
dictionary_path = pkg_resources.resource_filename("symspellpy", dict_file)
# term_index is the column of the term and count_index is the
# column of the term frequency
sym_spell.load_dictionary(dictionary_path, term_index=0, count_index=1)

with open(test_file,"r") as f:
    for line in f:
        for word in line.split(" "): 
# lookup suggestions for single-word input strings
#input_term = "helo"  # misspelling of "members"

# max edit distance per lookup
# (max_edit_distance_lookup <= max_dictionary_edit_distance)
            suggestions = sym_spell.lookup(word, Verbosity.TOP, max_edit_distance=3)
# display suggestion term, edit distance, and term frequency
            for suggestion in suggestions:
                print(suggestion)

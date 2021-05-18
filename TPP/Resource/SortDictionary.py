# Robot Framework extended Python function to sort a dictionary
def sort_dict_asc_by_val(self):
    print ("Sorted dictionary in ascending manner based on values: ")
    sorted_dict = sorted(self.items(), key = lambda kv:(kv[1], kv[0]))
    print(sorted_dict)
    return sorted_dict
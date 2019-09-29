from cmd import Cmd

class TES_Prompt(Cmd):
    intro = 'Welcome to the TES Project Management System'
    prompt = 'TES> '
    def do_exit(self, inp):
        print("Bye")
        return True

    #Project Commands
    def do_LP(self, inp):
        print("Listing Projects")
    def do_NP(self, inp):
        print("New Project")
    def do_EP(self, inp):
        print("Edit Project")
    def do_SP(self, inp):
        print("Set Project")

    #Consultant Commands
    def do_LC(self, inp):
        print("Listing Consultants")
    def do_NC(self, inp):
        print("New Consultant")
    def do_EC(self, inp):
        print("Edit Consultant")

    #WBS Commands
    def do_LW(self, inp):
        print("Listing WBSs")
    def do_NW(self, inp):
        print("New WBS")
    def do_EW(self, inp):
        print("Edit WBS")
    def do_SW(self, inp):
        print("Set WBS")

    #Deliverable Commands
    def do_LD(self, inp):
        print("Listing Deliverables")
    def do_ND(self, inp):
        print("New Deliverable")
    def do_ED(self, inp):
        print("Edit Deliverable")
 
    #Action Item Commands
    def do_LA(self, inp):
        print("Listing Action Items")
    def do_NA(self, inp):
        print("New Action Item")
    def do_EA(self, inp):
        print("Edit Action Item")

    #Invoice Commands
    def do_LI(self, inp):
        print("Listing Invoices")
    def do_NI(self, inp):
        print("New Invoice")
    def do_EI(self, inp):
        print("Edit Invoice")


    def do_reset(self, inp):
        reset()
TES_Prompt().cmdloop()
print("done")

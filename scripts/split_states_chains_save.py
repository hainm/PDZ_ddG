from pymol import cmd, stored

def split_states_chains_save( sel1 ):
    '''
    Simple script to split states of NMR ensemble and then save the complex and chain A separately for each state
    '''

    for ind in range(1,cmd.count_states(sel1)+1):
        if cmd.count_states(sel1) > 1:
            file_prefix="{0}_{1:04d}".format(sel1, ind)
        else:
            file_prefix=sel1    
        cmd.save(file_prefix + "_complex.pdb", file_prefix)
        cmd.split_chains(file_prefix)
        cmd.save(file_prefix + ".pdb", file_prefix + "_A")
        
cmd.extend( "split_states_chains_save", split_states_chains_save );

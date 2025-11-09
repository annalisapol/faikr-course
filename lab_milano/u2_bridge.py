from search import *

class U2BridgeProblem(Problem):

    def __init__(self, initial, goal, timing, max_time):
        self.super().__init__(initial, goal)
        self.timing = timing
        self.max_time = max_time
        self.vel = [1,2,5,10]    
    def action(self,state):
        possible_actions = []
        left, right, torch = state
        if torch:
            for x in left:
                possible_actions.append(x.lower() + "r")
            for i in range(len(left)):
                for j in range(i+1, len(left)):
                    possible_actions.append(left[i].lower() + left[j].lower() + "r")
        else:
            for x in right:
                possible_actions.append(x.lower() + "l")
            for i in range (len(right)):
                for j in range(i+1, len(right)):
                    possible_actions.append(right[i].lower() + right[j].lower()+"l")
        return possible_actions
    
    def result(self, state, action):
        res = list(state) 
        (x,y), move = action

        if move:
            res[0[x]] = False
            res[0[y]] = False
            res[1[x]] = True
            res[1[y]] = True
            timing += max (time(x),time(y))
        if not move:
            res[0[x]] = True
            res[1[x]] = False
            timing += time(x)
        
    def h(self, node):



        
    




initial_state = [ ["Bono", "Edge", "Adam", "Larry"], [ ], 1]
goal_state =  [ [ ], ["Bono", "Edge", "Adam", "Larry"], 0]

U2BridgeProblem(initial_state, goal_state, 17)
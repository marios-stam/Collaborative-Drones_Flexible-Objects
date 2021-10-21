from matplotlib import pyplot as plt
from collections import deque 

XYZ_GRAPH_BUFFER_SIZE=50

class xyz_graph:
    def __init__(self, buffer_len=XYZ_GRAPH_BUFFER_SIZE):
        plt.ion()
        self.fig=plt.figure()
        self.ax_x=plt.subplot(3,1,1)
        self.ax_y=plt.subplot(3,1,2)
        self.ax_z=plt.subplot(3,1,3)

        self.settings()

        self.x_buff = deque([0] * buffer_len , maxlen=buffer_len ) 
        self.y_buff = deque([0] * buffer_len , maxlen=buffer_len ) 
        self.z_buff = deque([0] * buffer_len , maxlen=buffer_len ) 

    def settings(self):
        self.ax_x.title.set_text('X')
        self.ax_y.title.set_text('Y')
        self.ax_z.title.set_text('Z')

        self.ax_x.set_ylim([-50, 50 ])
        self.ax_y.set_ylim([-50, 50 ])
        self.ax_z.set_ylim([ 0 , 400])

        # self.ax_x.set_ylim([0, 800 ])
        # self.ax_y.set_ylim([0, 800 ])
        # self.ax_z.set_ylim([0, 800])
    
    def update(self,tvec):
      
        self.x_buff.append(tvec[0][0][0])
        self.y_buff.append(tvec[0][0][1])
        self.z_buff.append(tvec[0][0][2])

        self.ax_x.clear()
        self.ax_y.clear()
        self.ax_z.clear()

        self.settings()

        self.ax_x.plot( list(self.x_buff) )
        self.ax_y.plot( list(self.y_buff) )
        self.ax_z.plot( list(self.z_buff) )
        plt.tight_layout()
        plt.draw()
        plt.pause(0.000001)

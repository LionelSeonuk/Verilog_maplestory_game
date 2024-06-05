module maple_ground(
    output      ground ,
    input [9:0] maple_x,
    input [9:0] maple_y
);

    // Define image width, height
    parameter WIDTH = 41, HEIGHT = 49;

    parameter REAL_GROUND = 385;
    
    wire [9:0] left, right;
    wire [9:0] top, bottom;

    assign left = maple_x;
    assign top = maple_y;
    assign right = left + WIDTH;
    assign bottom = top + HEIGHT;
    
    wire real_ground;
    
     assign real_ground = (bottom == REAL_GROUND);
     
     assign ground= real_ground;
     
     endmodule
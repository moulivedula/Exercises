<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">

    <title>Tree Example</title>

    <style>
	
	.node {
		cursor: pointer;
	}

	.node circle {
	  fill: #fff;
	  stroke: steelblue;
	  stroke-width: 3px;
	}

	.node text {
	  font: 12px sans-serif;
	}

	.link {
	  fill: none;
	  stroke: #ccc;
	  stroke-width: 2px;
	}
	
    </style>

  </head>

  <body>

<!-- load the d3.js library -->	
<script src="http://d3js.org/d3.v3.min.js"></script>
	
<script>

var treeData = [
  {
    "name": "Top Hierarchy",
    "parent": "null",
    "children": [
      {
        "name": "Center",
        "parent": "Top Hierarchy",
        "children": [
          {
            "name": "Dairy",
            "parent": "Level 2: A",
            "children": [
            	{
	            	"name": "Cheese",
	                "parent": "Level 3: A",
	                "children": [
	                	{
	    	            	"name": "Cheese Sauce",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "Specialty Cheese",
	    	                "parent": "Level 4: A"
	                	}
                	]
            	},
            	{
               		"name": "Cream or Creamer",
                   	"parent": "Level 3: A",
	                "children": [
	                	{
	    	            	"name": "Dairy Alternative Creamer",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "Whipping Creams",
	    	                "parent": "Level 4: A"
	                	}
                	]
               	},
            	{
               		"name": "Cultured",
                   	"parent": "Level 3: A",
	                "children": [
	                	{
	    	            	"name": "Cottage Cheese",
	    	                "parent": "Level 4: A"
	                	}
                	]
               	},
            	{
               		"name": "Refrigerated Baking",
                   	"parent": "Level 3: A",
	                "children": [
	                	{
	    	            	"name": "Refrigerated Breads",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "Refrigerated English Muffins and Biscuits",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "Refrigerated Hand Held Sweets",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "Refrigerated Pie Crust",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "Refrigerated Sweet Breakfast Baked Goods",
	    	                "parent": "Level 4: A"
	                	}
                	]
               	}
            ]
          },
          {
            "name": "Frozen",
            "parent": "Level 2: A",
            "children": [
            	{
	            	"name": "Frozen Bake",
	                "parent": "Level 3: A",
	                "children": [
	                	{
	    	            	"name": "Bread or Dough Products Frozen",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "Breakfast Cake or Sweet Roll Frozen",
	    	                "parent": "Level 4: A"
	                	}
                	]
            	},
            	{
               		"name": "Frozen Breakfast",
                   	"parent": "Level 3: A",
	                "children": [
	                	{
	    	            	"name": "Frozen Breakfast Entrees",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "Frozen Breakfast Sandwich",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "Frozen Egg Substitutes",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "Frozen Syrup Carriers",
	    	                "parent": "Level 4: A"
	                	}
                	]
               	},
            	{
               		"name": "Frozen Desserts or Fruit and Toppings",
                   	"parent": "Level 3: A",
	                "children": [
	                	{
	    	            	"name": "Pies Frozen",
	    	                "parent": "Level 4: A"
	                	}
                	]
               	},
            	{
               		"name": "Frozen Juice",
                   	"parent": "Level 3: A",
	                "children": [
	                	{
	    	            	"name": "Frozen Apple Juice",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "Frozen Fruit Drink Mixers",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "Frozen Fruit Juice All Other",
	    	                "parent": "Level 4: A"
	                	}
                	]
               	}
             ]
          },
          {
             "name": "GM",
             "parent": "Level 2: A",
             "children": [
             	{
 	            	"name": "Audio Video",
 	                "parent": "Level 3: A",
	                "children": [
	                	{
	    	            	"name": "Audio",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "Video DVD",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "Video VHS",
	    	                "parent": "Level 4: A"
	                	}
                	]
             	},
             	{
                		"name": "Housewares",
                    	"parent": "Level 3: A",
    	                "children": [
    	                	{
    	    	            	"name": "Bedding",
    	    	                "parent": "Level 4: A"
    	                	},
    	                	{
    	    	            	"name": "Candles",
    	    	                "parent": "Level 4: A"
    	                	},
    	                	{
    	    	            	"name": "Collectibles and Gifts",
    	    	                "parent": "Level 4: A"
    	                	},
    	                	{
    	    	            	"name": "Flashlights",
    	    	                "parent": "Level 4: A"
    	                	},
    	                	{
    	    	            	"name": "Frames",
    	    	                "parent": "Level 4: A"
    	                	}
                    	]
                	},
	             	{
                		"name": "Insect and Rodent",
                    	"parent": "Level 3: A",
    	                "children": [
    	                	{
    	    	            	"name": "Indoor Repellants or Traps",
    	    	                "parent": "Level 4: A"
    	                	},
    	                	{
    	    	            	"name": "Outdoor Repellants or Traps",
    	    	                "parent": "Level 4: A"
    	                	}
   	                	]
                	},
	             	{
                		"name": "Kitchen Accessories",
                    	"parent": "Level 3: A",
    	                "children": [
    	                	{
    	    	            	"name": "Kitchen Accessories",
    	    	                "parent": "Level 4: A"
    	                	}
   	                	]
                	},
             		{
                		"name": "Laundry",
                    	"parent": "Level 3: A",
    	                "children": [
    	                	{
    	    	            	"name": "Bleach Liquid",
    	    	                "parent": "Level 4: A"
    	                	},
    	                	{
    	    	            	"name": "Bleach Powder",
    	    	                "parent": "Level 4: A"
    	                	},
    	                	{
    	    	            	"name": "Fabric Softener Liquid",
    	    	                "parent": "Level 4: A"
    	                	},
    	                	{
    	    	            	"name": "Fabric Softener Sheets",
    	    	                "parent": "Level 4: A"
    	                	}
   	                	]
                	}
              ]
           },
           {
               "name": "Grocery",
               "parent": "Level 2: A",
               "children": [
                	{
    	            	"name": "Baking Ingredients",
    	                "parent": "Level 3: A",
    	                "children": [
    	                	{
    	    	            	"name": "Dry or Canned Milk",
    	    	                "parent": "Level 4: A"
    	                	},
    	                	{
    	    	            	"name": "Food Coloring",
    	    	                "parent": "Level 4: A"
    	                	}
   	                	]
                	},
                	{
                   		"name": "Spices",
                       	"parent": "Level 3: A",
    	                "children": [
    	                	{
    	    	            	"name": "Salt Cooking or Edible or Seasoned",
    	    	                "parent": "Level 4: A"
    	                	},
    	                	{
    	    	            	"name": "Salt Substitute",
    	    	                "parent": "Level 4: A"
    	                	},
    	                	{
    	    	            	"name": "Seasoning Dry",
    	    	                "parent": "Level 4: A"
    	                	}
   	                	]
                   	},
                	{
                   		"name": "Stuffing Products",
                       	"parent": "Level 3: A",
    	                "children": [
    	                	{
    	    	            	"name": "Stuffing Products",
    	    	                "parent": "Level 4: A"
    	                	}
   	                	]
                   	}
                 ]
             }
        ]
      },
      {
        "name": "Perimeter",
        "parent": "Top Level",
        "children": [
          {
             "name": "Bakery",
             "parent": "Level 2: A",
             "children": [
             	{
 	            	"name": "Bakery Bread",
 	                "parent": "Level 3: A",
	                "children": [
	                	{
	    	            	"name": "Bagels",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "Baking or Breading Products",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "English Muffins or Biscuits",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "Flatbreads",
	    	                "parent": "Level 4: A"
	                	}
                	]
             	},
             	{
               		"name": "In Store Bakery",
                   	"parent": "Level 3: A",
	                "children": [
	                	{
	    	            	"name": "Breakfast Cake or Sweet Roll",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "Cakes",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "Pies",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "Seasonal",
	    	                "parent": "Level 4: A"
	                	}
                	]
               	}
              ]
           },
           {
             "name": "Deli and Foodservice",
             "parent": "Level 2: A",
             "children": [
              	{
  	            	"name": "Self Service Deli Cold",
  	                "parent": "Level 3: A",
	                "children": [
	                	{
	    	            	"name": "Beverages",
	    	                "parent": "Level 4: A"
	                	}
                	]
              	},
              	{
               		"name": "Service Deli",
                   	"parent": "Level 3: A",
	                "children": [
	                	{
	    	            	"name": "Cheese All Other",
	    	                "parent": "Level 4: A"
	                	},
	                	{
	    	            	"name": "Cheese American",
	    	                "parent": "Level 4: A"
	                	}
                	]
               	}
              ]
           },
           {
              "name": "Floral",
              "parent": "Level 2: A",
              "children": [
                	{
    	            	"name": "Bouquets and Cut Flowers",
    	                "parent": "Level 3: A",
    	                "children": [
    	                	{
    	    	            	"name": "Bouquets and Cut Flowers",
    	    	                "parent": "Level 4: A"
    	                	}
                    	]
                	},
                	{
                 		"name": "Gifts",
                     	"parent": "Level 3: A",
    	                "children": [
    	                	{
    	    	            	"name": "Gifts",
    	    	                "parent": "Level 4: A"
    	                	}
                    	]
                 	},
                	{
                 		"name": "Plants",
                     	"parent": "Level 3: A",
    	                "children": [
    	                	{
    	    	            	"name": "Plants",
    	    	                "parent": "Level 4: A"
    	                	}
                    	]
                 	}
                ]
            },
            {
                "name": "Seafood",
                "parent": "Level 2: A",
                "children": [
                 	{
     	            	"name": "Frozen Shellfish",
     	                "parent": "Level 3: A",
    	                "children": [
    	                	{
    	    	            	"name": "Frozen Shellfish",
    	    	                "parent": "Level 4: A"
    	                	}
                    	]
                 	},
                 	{
                  		"name": "Other Seafood",
                      	"parent": "Level 3: A",
    	                "children": [
    	                	{
    	    	            	"name": "All Other Seafood",
    	    	                "parent": "Level 4: A"
    	                	},
    	                	{
    	    	            	"name": "Prepared Seafood Entrees",
    	    	                "parent": "Level 4: A"
    	                	},
    	                	{
    	    	            	"name": "Seafood Breading Sauces Dips",
    	    	                "parent": "Level 4: A"
    	                	},
    	                	{
    	    	            	"name": "Seafood Salads",
    	    	                "parent": "Level 4: A"
    	                	},
    	                	{
    	    	            	"name": "Smoked Fish",
    	    	                "parent": "Level 4: A"
    	                	}
                    	]
                  	}
                 ]
              }
         ]
      }
    ]
  }
];


// ************** Generate the tree diagram	 *****************
var margin = {top: 20, right: 120, bottom: 20, left: 120},
	width = 1100 - margin.right - margin.left,
	height = 600 - margin.top - margin.bottom;
	
var i = 0,
	duration = 750,
	root;

var tree = d3.layout.tree()
	.size([height, width]);

var diagonal = d3.svg.diagonal()
	.projection(function(d) { return [d.y, d.x]; });

var svg = d3.select("body").append("svg")
	.attr("width", width + margin.right + margin.left)
	.attr("height", height + margin.top + margin.bottom)
  .append("g")
	.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

root = treeData[0];
root.x0 = height / 2;
root.y0 = 0;
  
update(root);

d3.select(self.frameElement).style("height", "500px");

function update(source) {

  // Compute the new tree layout.
  var nodes = tree.nodes(root).reverse(),
	  links = tree.links(nodes);

  // Normalize for fixed-depth.
  nodes.forEach(function(d) { d.y = d.depth * 180; });

  // Update the nodes…
  var node = svg.selectAll("g.node")
	  .data(nodes, function(d) { return d.id || (d.id = ++i); });

  // Enter any new nodes at the parent's previous position.
  var nodeEnter = node.enter().append("g")
	  .attr("class", "node")
	  .attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
	  .on("click", click);

  nodeEnter.append("circle")
	  .attr("r", 1e-6)
	  .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });

  nodeEnter.append("text")
	  .attr("x", function(d) { return d.children || d._children ? -13 : 13; })
	  .attr("dy", ".35em")
	  .attr("text-anchor", function(d) { return d.children || d._children ? "end" : "start"; })
	  .text(function(d) { return d.name; })
	  .style("fill-opacity", 1e-6);

  // Transition nodes to their new position.
  var nodeUpdate = node.transition()
	  .duration(duration)
	  .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });

  nodeUpdate.select("circle")
	  .attr("r", 10)
	  .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });

  nodeUpdate.select("text")
	  .style("fill-opacity", 1);

  // Transition exiting nodes to the parent's new position.
  var nodeExit = node.exit().transition()
	  .duration(duration)
	  .attr("transform", function(d) { return "translate(" + source.y + "," + source.x + ")"; })
	  .remove();

  nodeExit.select("circle")
	  .attr("r", 1e-6);

  nodeExit.select("text")
	  .style("fill-opacity", 1e-6);

  // Update the links…
  var link = svg.selectAll("path.link")
	  .data(links, function(d) { return d.target.id; });

  // Enter any new links at the parent's previous position.
  link.enter().insert("path", "g")
	  .attr("class", "link")
	  .attr("d", function(d) {
		var o = {x: source.x0, y: source.y0};
		return diagonal({source: o, target: o});
	  });

  // Transition links to their new position.
  link.transition()
	  .duration(duration)
	  .attr("d", diagonal);

  // Transition exiting nodes to the parent's new position.
  link.exit().transition()
	  .duration(duration)
	  .attr("d", function(d) {
		var o = {x: source.x, y: source.y};
		return diagonal({source: o, target: o});
	  })
	  .remove();

  // Stash the old positions for transition.
  nodes.forEach(function(d) {
	d.x0 = d.x;
	d.y0 = d.y;
  });
}

// Toggle children on click.
function click(d) {
  if (d.children) {
	d._children = d.children;
	d.children = null;
  } else {
	d.children = d._children;
	d._children = null;
  }
  update(d);
}

</script>
	
  </body>
</html>
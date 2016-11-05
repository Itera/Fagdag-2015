<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="facet-filtering.ascx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Units.Searching.facet_filtering" %>

<div class="row C_Search-Browse-Filter">
	<div class="span3">
		<div class="well">
			<ul class="unstyled">
				<li> 
				<h3>
					Active Filters 
				</h3>
				</li>
				<li>Color: <strong> Purple <a href="#"> &times;</a></strong></li>
				<li>Size: <strong> Large <a href="#"> &times;</a></strong> <strong> Medium <a href="#"> &times;</a></strong></li>
				<li>Brand: <strong> Apple <a href="#"> &times;</a></strong></li>
				<li>Price: <strong> $200.00 to $300.00 <a href="#"> &times;</a></strong></li>
			</ul>
			<a href="#">Clear All</a> 
		</div>
		<div class="well">
			<ul class="nav nav-list">
				<li class="nav-header">Specials</li>
				<li><a href="#">On Sale (20)</a></li>
				<li><a href="#">New Arrivals (30)</a></li>
				<li><a href="#">Marketing Category 1 (6)</a></li>
				<li><a href="#">Marketing Category 2 (18)</a></li>
				<li class="nav-header">Brand</li>
				<li><a href="#">Apple (20)</a></li>
				<li><a href="#">Dell (30)</a></li>
				<li><a href="#">Vera Wang (6)</a></li>
				<li><a href="#">Brand Name 4 (18)</a></li>
				<li class="nav-header">Color</li>
				<li><a href="#">Red (123)</a></li>
				<li><a href="#">Blue (15)</a></li>
				<li><a href="#">Yellow (9)</a></li>
				<li class="nav-header">Size</li>
				<li><a href="#">Large (123)</a></li>
				<li><a href="#">X-Large (15)</a></li>
				<li><a href="#">Small (9)</a></li>
				<li><a href="#">Medium (19)</a></li>
				<li><a href="#">X-Small (9)</a></li>
				<li class="nav-header">Author</li>
				<li><a href="#">Paul Smith (123)</a></li>
				<li><a href="#">Marge Flitter (15)</a></li>
				<li><a href="#">Parker Stephenson (9)</a></li>
			</ul>
		</div>
		<hr />
	</div>
	<div class="span9">
		<h3>
			Search Results 
		</h3>
		<hr />
		<div class="row">
			<div class="span5">
				<ul class="nav nav-pills">
					<li class="active"><a href="#"><i class="icon-th-large icon-white"></i> Large Grid</a></li>
					<li><a href="#"><i class="icon-th"></i> Small Grid</a></li>
					<li><a href="#"><i class="icon-th-list"></i> List View</a></li>
				</ul>
			</div>
			<div class="span4">
				<div class="pagination pagination-right" style="margin-top:0;">
					<ul>
						<li><a href="#">←</a></li>
						<li class="active"><a href="#">10</a></li>
						<li class="disabled"><a href="#">...</a></li>
						<li><a href="#">20</a></li>
						<li><a href="#">→</a></li>
					</ul>
				</div>
			</div>
		</div>
		<ul class="thumbnails">
			<li class="span3"> 
			<div class="thumbnail">
				<a href="#" class="thumbnail"><img src="http://placehold.it/300x400.png" alt=""></a> 
				<div class="caption">
					<a href="#"> Product Item or Variation Name That Might Be Long </a> 
					<p>
						Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit. 
					</p>
					<ul class="unstyled">
						<li>Brand: Amazing</li>
						<li>In Stock: 25</li>
						<li>Customer Reviews : ****</li>
					</ul>
					<hr />
					<strike>$100.00</strike> Your Price: <strong>$80.00</strong><br />
					<br />
					You Save <strong>$20.00</strong> 
					<hr />
					<div class="btn-group">
						<a class="btn btn-success" href="#"><i class="icon-shopping-cart icon-white"></i> Add to Cart</a> <a class="btn btn-success dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a> 
						<ul class="dropdown-menu">
							<li><a href="#"><i class="icon-cog"></i> Add to Wishlist</a></li>
							<li><a href="#"><i class="icon-cog"></i> Post to Facebook</a></li>
							<li><a href="#"><i class="icon-cog"></i> Post to Twitter</a></li>
							<li class="divider"></li>
							<li><a href="#"><i class="icon-gift"></i> Create Custom Gift Card</a></li>
							<li class="divider"></li>
							<li><a href="#"><i class="icon-envelope"></i> eMail Share</a></li>
						</ul>
					</div>
				</div>
			</div>
			</li>
			<li class="span3"> 
			<div class="thumbnail">
				<a href="#" class="thumbnail"><img src="http://placehold.it/300x400.png" alt=""></a> 
				<div class="caption">
					<a href="#"> Product Item or Variation Name That Might Be Long </a> 
					<p>
						Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit. 
					</p>
					<ul class="unstyled">
						<li>Brand: Amazing</li>
						<li>In Stock: 25</li>
						<li>Customer Reviews : ****</li>
					</ul>
					<hr />
					<strike>$100.00</strike> Your Price: <strong>$80.00</strong><br />
					<br />
					You Save <strong>$20.00</strong> 
					<hr />
					<div class="btn-group">
						<a class="btn btn-success" href="#"><i class="icon-shopping-cart icon-white"></i> Add to Cart</a> <a class="btn btn-success dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a> 
						<ul class="dropdown-menu">
							<li><a href="#"><i class="icon-cog"></i> Add to Wishlist</a></li>
							<li><a href="#"><i class="icon-cog"></i> Post to Facebook</a></li>
							<li><a href="#"><i class="icon-cog"></i> Post to Twitter</a></li>
							<li class="divider"></li>
							<li><a href="#"><i class="icon-gift"></i> Create Custom Gift Card</a></li>
							<li class="divider"></li>
							<li><a href="#"><i class="icon-envelope"></i> eMail Share</a></li>
						</ul>
					</div>
				</div>
			</div>
			</li>
			<li class="span3"> 
			<div class="thumbnail">
				<a href="#" class="thumbnail"><img src="http://placehold.it/300x400.png" alt=""></a> 
				<div class="caption">
					<a href="#"> Product Item or Variation Name That Might Be Long </a> 
					<p>
						Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit. 
					</p>
					<ul class="unstyled">
						<li>Brand: Amazing</li>
						<li>In Stock: 25</li>
						<li>Customer Reviews : ****</li>
					</ul>
					<hr />
					<strike>$100.00</strike> Your Price: <strong>$80.00</strong><br />
					<br />
					You Save <strong>$20.00</strong> 
					<hr />
					<div class="btn-group">
						<a class="btn btn-success" href="#"><i class="icon-shopping-cart icon-white"></i> Add to Cart</a> <a class="btn btn-success dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a> 
						<ul class="dropdown-menu">
							<li><a href="#"><i class="icon-cog"></i> Add to Wishlist</a></li>
							<li><a href="#"><i class="icon-cog"></i> Post to Facebook</a></li>
							<li><a href="#"><i class="icon-cog"></i> Post to Twitter</a></li>
							<li class="divider"></li>
							<li><a href="#"><i class="icon-gift"></i> Create Custom Gift Card</a></li>
							<li class="divider"></li>
							<li><a href="#"><i class="icon-envelope"></i> eMail Share</a></li>
						</ul>
					</div>
				</div>
			</div>
			</li>
		</ul>
		<hr />
		<div class="pagination pagination-right">
			<ul>
				<li><a href="#">←</a></li>
				<li class="active"><a href="#">10</a></li>
				<li class="disabled"><a href="#">...</a></li>
				<li><a href="#">20</a></li>
				<li><a href="#">→</a></li>
			</ul>
		</div>
	</div>
</div>
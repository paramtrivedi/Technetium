<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminCSS.aspx.cs" Inherits="AdminCSS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Administration Panel</title>
<link media="screen" rel="stylesheet" type="text/css" href="css/admin.css"  />
<!--[if lte IE 6]><link media="screen" rel="stylesheet" type="text/css" href="css/admin-ie.css" /><![endif]-->
</head>
<body>
    <form id="form1" runat="server">
  	<!--[if !IE]>start wrapper<![endif]-->
	<div id="wrapper">
		<!--[if !IE]>start head<![endif]-->
		<div id="head">

<div id="logo_user_details">
				<h1 id="logo"><a href="#">websitename Administration Panel</a></h1>
				<!--[if !IE]>start user details<![endif]-->
				<div id="user_details">
					<ul id="user_details_menu">
						<li>Welcome <strong>
                            <asp:Label ID="lblUName" runat="server" Text=""></asp:Label></strong></li>
						<li>
							<ul id="user_access">
								<li class="first">
                                    <asp:HyperLink ID="HyperLink1" NavigateUrl="Profile.aspx" runat="server">Profile</asp:HyperLink></li>
								<li class="last">
                                    <asp:LinkButton ID="lnkLogout" runat="server" onclick="lnkLogout_Click">Logout</asp:LinkButton></li>
							</ul>
						</li>
						<li><!--<a class="new_messages" href="#">4 new messages</a>--></li>
					</ul>
					<div id="server_details">
						<dl>
							<dt>Server time :</dt>
							<dd><%=DateTime.Now.ToShortTimeString()  %></dd>
						</dl>
						<dl>
							<dt>Current Login ip :</dt>
							<dd><%=Request.UserHostAddress %></dd>
						</dl>
					</div>
					<!--[if !IE]>start search<![endif]-->
					<div id="search_wrapper">
						<form action="#">
							<fieldset>
								<label>
									<input class="text" name="" type="text" />
								</label>
								<span class="go"><input name="" type="submit" /></span>
							</fieldset>
						</form>
						<ul id="search_wrapper_menu">
							<li class="first"><a href="#">Advanced Search</a></li>
							<li class="last"><a href="#">Admin Map</a></li>
						</ul>
					</div>
				<!--[if !IE]>end search<![endif]-->
				</div>
				
				<!--[if !IE]>end user details<![endif]-->
				
			</div>
			
	<!--[if !IE]>start menus_wrapper<![endif]-->
			<div id="menus_wrapper">
				
				
				
				
				
				<div id="main_menu">
					<ul>
						<li><a href="AdminHome.aspx"><span><span>Dashboard</span></span></a></li>
						<li><a href="#"><span><span>Group View</span></span></a></li>
						<li><a href="#"><span><span>New Group</span></span></a></li>
						<li><a href="#"><span><span>User Accounts</span></span></a></li>
						<li><a href="#"><span><span>Group Map</span></span></a></li>
						<li><a href="#"><span><span>News</span></span></a></li>
						<!--<li class="last"><a href="#"><span><span>Static Pages</span></span></a></li>-->
					</ul>
				</div>
				
				<div id="sec_menu">
					<ul>
						<li><a href="#" class="sm11">&nbsp;</a></li>
						<!--
						<li><a href="#" class="sm2">Chat and PMs</a></li>
						<li><a href="#" class="sm3">Search Options</a></li>
						<li><a href="#" class="sm4">Moderators</a></li>
						<li><a href="#" class="sm5">Upload Options</a></li>
						<li><a href="#" class="sm6">Download Options</a></li>
						<li><a href="#" class="sm7">Emails</a></li>
						<li>
							<span class="drop"><span><span><a href="#" class="sm8">More</a></span></span></span>
							<ul>
								<li><a class="sm6" href="#">Download options</a></li>
								<li><a class="sm4" href="#">Menu item</a></li>
								<li><a class="sm6" href="#">Download options</a></li>
								<li><a class="sm6" href="#">Download options</a></li>
								<li><a class="sm6" href="#">Download options</a></li>
							</ul>
						</li>-->
					</ul>
				</div>
			</div>
			<!--[if !IE]>end menus_wrapper<![endif]-->
			
			
			
		</div>
		<!--[if !IE]>end head<![endif]-->

<div id="content">
			
			
			
			
			
			<!--[if !IE]>start page<![endif]-->
			<div id="page">
				<div class="inner">
					
					
					
					<!--[if !IE]>start section<![endif]-->	
					<div class="section">
						<!--[if !IE]>start title wrapper<![endif]-->
						<div class="title_wrapper">
							<h2>Dashboard</h2>
							<span class="title_wrapper_left"></span>
							<span class="title_wrapper_right"></span>
						</div>
						<!--[if !IE]>end title wrapper<![endif]-->
						<!--[if !IE]>start section content<![endif]-->
						<div class="section_content">
							<!--[if !IE]>start section content top<![endif]-->
							<div class="sct">
								<div class="sct_left">
									<div class="sct_right">
										<div class="sct_left">
											<div class="sct_right">
												<!--[if !IE]>start dashboard menu<![endif]-->
												<div class="dashboard_menu_wrapper">
												<ul class="dashboard_menu">
													<li><a href="#" class="d1"><span>User Management Tools</span></a></li>
													<li><a href="#" class="d2"><span>Setup upload folders</span></a></li>
													<li><a href="#" class="d3"><span>Manage photo galleries</span></a></li>
													<li><a href="#" class="d4"><span>Change site templates</span></a></li>
													<li><a href="#" class="d5"><span>SEO Tools and Settings</span></a></li>
													<li><a href="#" class="d6"><span>Email Settings and Templates</span></a></li>
													<li><a href="#" class="d7"><span>Homepage and Static Pages</span></a></li>
													<li><a href="#" class="d8"><span>Website Security Settings</span></a></li>
													<li><a href="#" class="d9"><span>Printable Pages Template</span></a></li>
													<li><a href="#" class="d10"><span>Date and Time Setup</span></a></li>
													<li><a href="#" class="d11"><span>Favorires Settings</span></a></li>
													<li><a href="#" class="d12"><span>Statistics and Graphs</span></a></li>
												</ul>
												</div>
												<!--[if !IE]>end dashboard menu<![endif]-->
												
												
												
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--[if !IE]>end section content top<![endif]-->
							<!--[if !IE]>start section content bottom<![endif]-->
							<span class="scb"><span class="scb_left"></span><span class="scb_right"></span></span>
							<!--[if !IE]>end section content bottom<![endif]-->
							
						</div>
						<!--[if !IE]>end section content<![endif]-->
					</div>
					<!--[if !IE]>end section<![endif]-->
					
					<div class="section table_section">
						<!--[if !IE]>start title wrapper<![endif]-->
						<div class="title_wrapper">
							<h2>Table Template</h2>
							<span class="title_wrapper_left"></span>
							<span class="title_wrapper_right"></span>
						</div>
						<!--[if !IE]>end title wrapper<![endif]-->
						<!--[if !IE]>start section content<![endif]-->
						<div class="section_content">
							<!--[if !IE]>start section content top<![endif]-->
							<div class="sct">
								<div class="sct_left">
									<div class="sct_right">
										<div class="sct_left">
											<div class="sct_right">
												
												
												<div  id="product_list">
												<!--[if !IE]>start table_wrapper<![endif]-->
												<div class="table_wrapper">
													<div class="table_wrapper_inner">
													<table cellpadding="0" cellspacing="0" width="100%">
														<tbody><tr>
															<th>No.</th>
															<th class="photo"><span>Photo</span></th>
															<th><a href="#" class="asc">Name</a></th>
															
															<th><a href="#">Price</a></th>
															<th><a href="#">Move</a></th>
															
															<th>Actions</th>
														</tr>
														
														<tr class="first">
															<td style="width: 16px;">1.</td>
															<td class="photo"><a href="#" class="product_thumb"><img src="images/product_photo.jpg" alt="" height="41" width="73" /></a></td>
															<td><a href="#" class="product_name">Flash Website Templates Package</a></td>
															
															<td style="width: 65px;">$106.38</td>
															<td style="width: 64px;">
																<div class="move_menu">
																	<ul>
																		<li><a href="#" class="move1">1</a></li>
																		<li><a href="#" class="move2">2</a></li>
																		<li><a href="#" class="move3">3</a></li>
																		<li><a href="#" class="move4">4</a></li>
																	</ul>
																</div>
															</td>
															<td style="width: 120px;">
																<div class="actions_menu">
																	<ul>
																		
																		<li><a class="edit" href="#">Edit</a></li>
																		<li><a class="delete" href="#">Delete</a></li>
																	</ul>
																</div>
															</td>
														</tr>
														
														<tr class="second">
															<td>1.</td>
															<td class="photo"><a href="#" class="product_thumb"><img src="images/product_photo.jpg" alt="" height="41" width="73" /></a></td>
															<td><a href="#" class="product_name">Flash Website Templates Package</a></td>
															
															<td>$106.38</td>
															<td>
																<div class="move_menu">
																	<ul>
																		<li><a href="#" class="move1">1</a></li>
																		<li><a href="#" class="move2">2</a></li>
																		<li><a href="#" class="move3">3</a></li>
																		<li><a href="#" class="move4">4</a></li>
																	</ul>
																</div>
															</td>
															<td>
																<div class="actions_menu">
																	<ul>
																		
																		<li><a class="edit" href="#">Edit</a></li>
																		<li><a class="delete" href="#">Delete</a></li>
																	</ul>
																</div>
															</td>
														</tr>
														
														<tr class="first">
															<td>1.</td>
															<td class="photo"><a href="#" class="product_thumb"><img src="images/product_photo.jpg" alt="" height="41" width="73" /></a></td>
															<td><a href="#" class="product_name">Flash Website Templates Package</a></td>
															
															<td>$106.38</td>
															<td>
																<div class="move_menu">
																	<ul>
																		<li><a href="#" class="move1">1</a></li>
																		<li><a href="#" class="move2">2</a></li>
																		<li><a href="#" class="move3">3</a></li>
																		<li><a href="#" class="move4">4</a></li>
																	</ul>
																</div>
															</td>
															<td>
																<div class="actions_menu">
																	<ul>
																		
																		<li><a class="edit" href="#">Edit</a></li>
																		<li><a class="delete" href="#">Delete</a></li>
																	</ul>
																</div>
															</td>
														</tr>
														
														<tr class="second">
															<td>1.</td>
															<td class="photo"><a href="#" class="product_thumb"><img src="images/product_photo.jpg" alt="" height="41" width="73" /></a></td>
															<td><a href="#" class="product_name">Flash Website Templates Package</a></td>
															
															<td>$106.38</td>
															<td>
																<div class="move_menu">
																	<ul>
																		<li><a href="#" class="move1">1</a></li>
																		<li><a href="#" class="move2">2</a></li>
																		<li><a href="#" class="move3">3</a></li>
																		<li><a href="#" class="move4">4</a></li>
																	</ul>
																</div>
															</td>
															<td>
																<div class="actions_menu">
																	<ul>
																		
																		<li><a class="edit" href="#">Edit</a></li>
																		<li><a class="delete" href="#">Delete</a></li>
																	</ul>
																</div>
															</td>
														</tr>
														
														<tr class="first">
															<td>1.</td>
															<td class="photo"><a href="#" class="product_thumb"><img src="images/product_photo.jpg" alt="" height="41" width="73" /></a></td>
															<td><a href="#" class="product_name">Flash Website Templates Package</a></td>
															
															<td>$106.38</td>
															<td>
																<div class="move_menu">
																	<ul>
																		<li><a href="#" class="move1">1</a></li>
																		<li><a href="#" class="move2">2</a></li>
																		<li><a href="#" class="move3">3</a></li>
																		<li><a href="#" class="move4">4</a></li>
																	</ul>
																</div>
															</td>
															<td>
																<div class="actions_menu">
																	<ul>
																		
																		<li><a class="edit" href="#">Edit</a></li>
																		<li><a class="delete" href="#">Delete</a></li>
																	</ul>
																</div>
															</td>
														</tr>
														
														<tr class="second">
															<td>1.</td>
															<td class="photo"><a href="#" class="product_thumb"><img src="images/product_photo.jpg" alt="" height="41" width="73" /></a></td>
															<td><a href="#" class="product_name">Flash Website Templates Package</a></td>
															
															<td>$106.38</td>
															<td>
																<div class="move_menu">
																	<ul>
																		<li><a href="#" class="move1">1</a></li>
																		<li><a href="#" class="move2">2</a></li>
																		<li><a href="#" class="move3">3</a></li>
																		<li><a href="#" class="move4">4</a></li>
																	</ul>
																</div>
															</td>
															<td>
																<div class="actions_menu">
																	<ul>
																		
																		<li><a class="edit" href="#">Edit</a></li>
																		<li><a class="delete" href="#">Delete</a></li>
																	</ul>
																</div>
															</td>
														</tr>
														
													</tbody></table>
													</div>
												</div>
												<!--[if !IE]>end table_wrapper<![endif]-->
												</div>
												
												
												
												<!--[if !IE]>start pagination<![endif]-->
												<div class="pagination">
													<span class="page_no">Page 1 of 217</span>
													
													<ul class="pag_list">
														<li><a href="#" class="button light_blue_btn"><span><span>PREVIOUS</span></span></a> </li>
														<li><a href="#">1</a></li>
														<li><a href="#" class="current_page"><span><span>2</span></span></a></li>
														<li><a href="#">3</a></li>
														<li><a href="#">4</a></li>
														<li><a href="#">5</a></li>
														<li>[...]</li>
														<li><a href="#">217</a></li>
														<li><a href="#" class="button light_blue_btn"><span><span>NEXT</span></span></a> </li>
													</ul>
													
													
												</div>
												<!--[if !IE]>end pagination<![endif]-->
												
												
												
												
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--[if !IE]>end section content top<![endif]-->
							<!--[if !IE]>start section content bottom<![endif]-->
							<span class="scb"><span class="scb_left"></span><span class="scb_right"></span></span>
							<!--[if !IE]>end section content bottom<![endif]-->
							
						</div>
						<!--[if !IE]>end section content<![endif]-->
					</div>
					
					
					
					
					
					
					
					
					
					
					
						
				</div>
			</div>
			<!--[if !IE]>end page<![endif]-->
			<!--[if !IE]>start sidebar<![endif]-->
			<div id="sidebar">
				<div class="inner">
				
				
					<!--[if !IE]>start calendar<![endif]-->
					<div class="calendar">
						<div class="calendar_top">
							<strong>18:36</strong>
							<span>Thursday, 23rd December 2008</span>
						</div>
						<div class="calendar_middle">
                            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
						</div>
						<div class="calendar_bottom"></div>
						<!--[if !IE]>start section content footer<![endif]-->
						<div class="section_content_footer">
							<ul>
								<li><a href="#" class="plus">Add new event</a></li>
								<li><a href="#" class="next">Next Event</a></li>
							</ul>
							<span class="scf"></span>
						</div>
						<!--[if !IE]>end section content footer<![endif]-->
					</div>
					<!--[if !IE]>end calendar<![endif]-->
					
					
					
					
					
					
					
					<!--[if !IE]>start section<![endif]-->	
					<div class="section">
						<!--[if !IE]>start title wrapper<![endif]-->
						<div class="title_wrapper">
							<h2>To do list</h2>
							<span class="title_wrapper_left"></span>
							<span class="title_wrapper_right"></span>
						</div>
						<!--[if !IE]>end title wrapper<![endif]-->
						<!--[if !IE]>start section content<![endif]-->
						<div class="section_content">
							<!--[if !IE]>start section content top<![endif]-->
							<div class="sct">
								<div class="sct_left">
									<div class="sct_right">
										<div class="sct_left">
											<div class="sct_right">
													
													<div class="todo_list">
														<dl>
															<dt><span class="order">1</span> View pending orders list</dt>
															<dd>
																Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet elit pellentesque odio laoreet lacinia. 
															</dd>
															<dd>
																<ul class="todo_menu">
																	<li><a href="#">Get started</a></li>
																	<li><a href="#">Check notes</a></li>
																</ul>
															</dd>
														</dl>
													
														<dl>
															<dt><span class="order">2</span> Verify New Uploads</dt>
															<dd>
																Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet elit 
															</dd>
															<dd>
																<ul class="todo_menu">
																	<li><a href="#">Get started</a></li>
																	<li><a href="#">Approve all</a></li>
																</ul>
															</dd>
														</dl>
													
														<dl class="last">
															<dt><span class="order">3</span>Manage Banners</dt>
															<dd>
																Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet elit pellentesque odio laoreet lacinia.
															</dd>
															<dd>
																<ul class="todo_menu">
																	<li><a href="#">Go</a></li>
																	<li><a href="#">Config. 1</a></li>
																	<li><a href="#">Config. 2</a></li>
																</ul>
															</dd>
														</dl>
													</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--[if !IE]>end section content top<![endif]-->
							<!--[if !IE]>start section content bottom<![endif]-->
							<span class="scb"><span class="scb_left"></span><span class="scb_right"></span></span>
							<!--[if !IE]>end section content bottom<![endif]-->
							
						</div>
						<!--[if !IE]>end section content<![endif]-->
					</div>
					<!--[if !IE]>end section<![endif]-->
					
					
					<!--[if !IE]>start section<![endif]-->	
					<div class="section">
						<!--[if !IE]>start title wrapper<![endif]-->
						<div class="title_wrapper">
							<h2>Photo Gallery</h2>
							<span class="title_wrapper_left"></span>
							<span class="title_wrapper_right"></span>
						</div>
						<!--[if !IE]>end title wrapper<![endif]-->
						<!--[if !IE]>start section content<![endif]-->
						<div class="section_content">
							<!--[if !IE]>start section content top<![endif]-->
							<div class="sct">
								<div class="sct_left">
									<div class="sct_right">
										<div class="sct_left">
											<div class="sct_right">
												<div class="photo_gallery">
													
													
														<div class="gal_top">
															<div class="gal_bottom">
																<div class="gal_left">
																	<div class="gal_right">
																		<ul>
																			<li><a href="#"><img width="96" height="71" src="images/gallery_thumb.jpg" alt="" /></a></li>
																			<li><a href="#"><img width="96" height="71" src="images/gallery_thumb.jpg" alt="" /></a></li>
																			<li><a href="#"><img width="96" height="71" src="images/gallery_thumb.jpg" alt="" /></a></li>
																			<li><a href="#"><img width="96" height="71" src="images/gallery_thumb.jpg" alt="" /></a></li>
																			<li><a href="#"><img width="96" height="71" src="images/gallery_thumb.jpg" alt="" /></a></li>
																			<li><a href="#"><img width="96" height="71" src="images/gallery_thumb.jpg" alt="" /></a></li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>
													
													
													
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--[if !IE]>end section content top<![endif]-->
							
							<!--[if !IE]>start section content bottom<![endif]-->
							<span class="scb"><span class="scb_left"></span><span class="scb_right"></span></span>
							<!--[if !IE]>end section content bottom<![endif]-->
							
							<!--[if !IE]>start section content footer<![endif]-->
							<div class="section_content_footer">
								<ul>
									<li><a href="#" class="plus">Add new photo</a></li>
									<li><a href="#" class="list">View all photos</a></li>
								</ul>
								<span class="scf"></span>
							</div>
							<!--[if !IE]>end section content footer<![endif]-->
							
							
						</div>
						<!--[if !IE]>end section content<![endif]-->
					</div>
					<!--[if !IE]>end section<![endif]-->
					
					
					<!--[if !IE]>start quick info<![endif]-->
					<div class="quick_info">
						<div class="quick_info_top">
							<h2>Quick info</h2>
						</div>
						<div class="quick_info_content">
							<dl>
								<dt>12 products</dt>
								<dd>avaiting approval</dd>
							</dl>
							<dl>
								<dt>228 sales</dt>
								<dd>in the last 24 hours</dd>
							</dl>
							<dl>
								<dt>18 users</dt>
								<dd>currently online</dd>
							</dl>
							<dl>
								<dt>15.2%</dt>
								<dd>increase in traffic this month</dd>
							</dl>
						</div>
						<span class="quick_info_bottom"></span>
					</div>
					<!--[if !IE]>end quick info<![endif]-->
					
					
				
				
				</div>
			</div>
			<!--[if !IE]>end sidebar<![endif]-->
			
		</div>        
    </div>
    	
	<!--[if !IE]>start footer<![endif]-->
	<div id="footer">
		<div id="footer_inner">
		
		<dl class="copy">
			<dt><strong>HyperAdmin</strong> <em>build 26122008</em></dt>
			<dd>&copy; 2012-13 Technetium.com  All rights reserved.</dd>
		</dl>
		
		<dl class="quick_links">
			<dt><strong>Quick Links :</strong></dt>
			<dd>
				<ul>
					<li><a href="#">Dashboard </a></li>
					<li><a href="#">Profile</a></li>
					<li><a href="#">View Group</a></li>
					<li><a href="#">New Group</a></li>
					<li><a href="#">Users</a></li>
					<li class="last"><a href="#">Log out</a></li>
				</ul>
			</dd>
		</dl>
		
		</div>
	</div>
	<!--[if !IE]>end footer<![endif]-->

    </form>
</body>
</html>

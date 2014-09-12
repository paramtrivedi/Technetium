<%@ Page Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="AdminHome"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
													<li><a href="Userview.aspx" class="d1"><span>User Management Tools</span></a></li>
													<li><a href="GroupView.aspx" class="d2"><span>Group Management</span></a></li>
													<li><a href="GroupPost.aspx" class="d3"><span>Group Post</span></a></li>
													<li><a href="#" class="d4"><span>Change site templates</span></a></li>
													<li><a href="Newslection.aspx" class="d5"><span>Latest News</span></a></li>
													<li><a href="Email.aspx" class="d6"><span>Send Email </span></a></li>
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
</asp:Content>


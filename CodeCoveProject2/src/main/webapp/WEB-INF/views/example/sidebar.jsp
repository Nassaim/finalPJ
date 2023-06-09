<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--///////////Page sidebar begin///////////////-->
  <aside class="page-sidebar">
    <div class="h-100 flex-column d-flex justify-content-start">

      <!--Aside-logo-->
      <div class="aside-logo d-flex align-items-center flex-shrink-0 justify-content-start px-5 position-relative">
        <a href="index.html" class="d-block">
          <div class="d-flex align-items-center flex-no-wrap text-truncate">
            <!--Logo-icon-->
            <span class="sidebar-icon size-40 d-flex align-items-center justify-content-center fs-4 lh-1 text-white rounded-3 bg-gradient-primary fw-bolder"> A </span>
            <span class="sidebar-text">
              <!--Sidebar-text-->
              <span class="sidebar-text text-truncate fs-3 fw-bold">
                Assan
              </span>
            </span>
          </div>
        </a>
      </div>
      <!--Sidebar-Menu-->
      <div class="aside-menu px-3 my-auto" data-simplebar>
        <nav class="flex-grow-1 h-100" id="page-navbar">
          <!--:Sidebar nav-->
          <ul class="nav flex-column collapse-group collapse d-flex">
            <li class="nav-item sidebar-title text-truncate opacity-50 small">
              <i class="bi bi-three-dots"></i>
              <span>Main</span>
            </li>
            <li class="nav-item">
              <a href="index.html" class="nav-link d-flex align-items-center text-truncate active">
                <span class="sidebar-icon">
                  <span class="material-symbols-rounded">
                    sell
                    </span>
                </span>
                <!--Sidebar nav text-->
                <span class="sidebar-text">E-commerce</span>
              </a>
            </li>
            <li class="nav-item">
              <a href="index-analytics.html" class="nav-link d-flex align-items-center text-truncate ">
                <span class="sidebar-icon">
                  <span class="material-symbols-rounded">
                    monitoring
                    </span>
                </span>
                <!--Sidebar nav text-->
                <span class="sidebar-text">Analytics</span>
              </a>
            </li>
            <li class="nav-item">
              <a href="index-project-management.html" class="nav-link d-flex align-items-center text-truncate ">
                <span class="sidebar-icon">
                  <span class="material-symbols-rounded">
                    folder
                    </span>
                </span>
                <!--Sidebar nav text-->
                <span class="sidebar-text">Management</span>
              </a>
            </li>
    
            <li class="nav-item">
              <a href="widgets.html"
                class="nav-link d-flex align-items-center text-truncate ">
                <span class="sidebar-icon">
                  <span class="material-symbols-rounded">
                    widgets
                    </span>
                </span>
                <span class="sidebar-text">Widgets <span class="badge rounded-pill bg-success ms-3">60+</span></span>
              </a>
            </li>
            <li class="nav-item">
              <a data-bs-toggle="collapse"
                class="nav-link d-flex align-items-center text-truncate "
                aria-expanded="false" href="#ui-pages">
                <span class="sidebar-icon">
                  <span class="material-symbols-rounded">
                    sticky_note_2
                    </span>
                </span>
                <!--Sidebar nav text-->
                <span class="sidebar-text">Pages</span>
              </a>
              <ul id="ui-pages" class="sidebar-dropdown list-unstyled collapse indexs_collapse">
                <li class="sidebar-item">
                  <a href="#pages-account" data-bs-toggle="collapse" aria-expanded="false" class="sidebar-link @@account_active">
                    Account
                  </a>
                  <ul id="pages-account" class="sidebar-dropdown list-unstyled collapse sd-second-level @@account_collapse">
                    <li class="sidebar-item">
                      <a class="sidebar-link" href="account-general.html">General</a>
                    </li>
                    <li class="sidebar-item">
                      <a class="sidebar-link" href="account-billing.html">Billing</a>
                    </li>
                    <li class="sidebar-item">
                      <a class="sidebar-link" href="account-contacts.html">Contacts</a>
                    </li>
                    <li class="sidebar-item">
                      <a class="sidebar-link" href="account-security.html">Security</a>
                    </li>
                    <li class="sidebar-item">
                      <a class="sidebar-link" href="account-notifications.html">Notification</a>
                    </li>
                  </ul>
                </li>
                <li class="sidebar-item">
                  <a href="#pages-profile" data-bs-toggle="collapse" aria-expanded="false" class="sidebar-link @@profile_active">
                    Profile
                  </a>
                  <ul id="pages-profile" class="sidebar-dropdown list-unstyled collapse sd-second-level @@profile_collapse">
                    <li class="sidebar-item">
                      <a class="sidebar-link @@profile_overview" href="profile.html">Overview</a>
                    </li>
                  </ul>
                </li>
                <li class="sidebar-item">
                  <a href="#pages-authentication" data-bs-toggle="collapse" aria-expanded="false" class="sidebar-link">
                    Authentication
                  </a>
                  <ul id="pages-authentication" class="sidebar-dropdown list-unstyled collapse sd-second-level">
                    <li class="sidebar-item">
                      <a class="sidebar-link" target="_blank" href="page-auth-signin.html">SignIn</a>
                    </li>
                    <li class="sidebar-item">
                      <a class="sidebar-link" target="_blank" href="page-auth-signup.html">SignUp</a>
                    </li>
                    <li class="sidebar-item">
                      <a class="sidebar-link" target="_blank" href="page-auth-recover-pass.html">Recover password</a>
                    </li>
                    <li class="sidebar-item">
                      <a class="sidebar-link" href="page-auth-success.html">Success</a>
                    </li>
                    <li class="sidebar-item">
                      <a class="sidebar-link" target="_blank" href="page-auth-lockscreen.html">lockscreen</a>
                    </li>
                  </ul>
                </li>
                <li class="sidebar-item"><a class="sidebar-link index_search" href="page-search.html">Search</a></li>
                <li class="sidebar-item"><a class="sidebar-link index_invoice" href="page-invoice.html">Invoice</a></li>
                <li class="sidebar-item"><a class="sidebar-link index_tasks" href="page-tasks.html">Tasks</a></li>
                <li class="sidebar-item"><a class="sidebar-link index_pricing" href="page-pricing.html">Pricing</a></li>
                <li class="sidebar-item">
                  <a href="#pages-projects" data-bs-toggle="collapse" aria-expanded="false" class="sidebar-link @@projects_active">
                    Projects
                  </a>
                  <ul id="pages-projects" class="sidebar-dropdown list-unstyled @@projects_collapse_show collapse sd-second-level">
                    <li class="sidebar-item">
                      <a class="sidebar-link @@projects" href="projects-list.html">List</a>
                    </li>
                    <li class="sidebar-item">
                      <a class="sidebar-link @@project_detail" href="project-detail.html">Details</a>
                    </li>
                  </ul>
                </li>
                <li class="sidebar-item"><a class="sidebar-link index_404" href="page-404.html">404 Error</a></li>
                <li class="sidebar-item"><a class="sidebar-link index_blank" href="page-blank.html">Blank Page</a></li>
              </ul>
            </li>


            <li class="nav-item mt-2 sidebar-title text-truncate small opacity-50">
              <i class="bi bi-three-dots"></i>
              <span>Apps</span>
            </li>
            <li class="nav-item">
              <a href="app-inbox.html"
                class="nav-link d-flex align-items-center text-truncate ">
                <span class="sidebar-icon">
                  <span class="material-symbols-rounded">
                    all_inbox
                    </span>
                </span>
                <span class="sidebar-text">Inbox <span class="badge rounded-pill bg-primary small lh-1 ms-3">1
                    new</span></span>
              </a>
            </li>
            <li class="nav-item">
              <a href="app-chat.html"
                class="nav-link d-flex align-items-center text-truncate ">
                <span class="sidebar-icon">
                  <span class="material-symbols-rounded">
                    chat
                    </span>
                </span>
                <span class="sidebar-text">Chat</span>
              </a>
            </li>
            <li class="nav-item">
              <a href="app-calendar.html"
                class="nav-link d-flex align-items-center text-truncate ">
                <span class="sidebar-icon">
                  <span class="material-symbols-rounded">
                    calendar_month
                    </span>
                </span>
                <span class="sidebar-text">Calendar</span>
              </a>
            </li>
            <li class="nav-item mt-2 sidebar-title text-truncate small opacity-50">
              <i class="bi bi-three-dots"></i>
              <span>Features</span>
            </li>
            <li class="nav-item">
              <a href="#layouts" data-bs-toggle="collapse" aria-expanded="false"
                class="nav-link d-flex align-items-center text-truncate ">
                <span class="sidebar-icon">
                  <span class="material-symbols-rounded">
                    space_dashboard
                    </span>
                </span>
                <!--Sidebar nav text-->
                <span class="sidebar-text">Layouts</span>
              </a>
              <ul id="layouts" class="sidebar-dropdown list-unstyled collapse @@layout_collapse_show">
                <li class="sidebar-item"><a class="sidebar-link @@layout_compact" href="layout-compact.html">Compact</a></li>
                <li class="sidebar-item"><a class="sidebar-link" href="layout-horizontal.html">Horizontal</a></li>
                <li class="sidebar-item"><a class="sidebar-link @@layout_boxed" href="layout-boxed.html">Boxed</a></li>
              </ul>
            </li>
            <li class="nav-item">
              <a href="#ui-components" data-bs-toggle="collapse" aria-expanded="false"
                class="nav-link d-flex align-items-center text-truncate ">
                <span class="sidebar-icon">
                  <span class="material-symbols-rounded">
                    construction
                    </span>
                </span>
                <!--Sidebar nav text-->
                <span class="sidebar-text">UI Components</span>
              </a>
              <ul id="ui-components" class="sidebar-dropdown list-unstyled collapse @@components_collapse">
        
                <li class="sidebar-item"><a class="sidebar-link @@component_avatars_active" href="ui-component-avatars.html">Avatars</a></li>
                <li class="sidebar-item"><a class="sidebar-link @@component_accordion_active" href="ui-component-accordion.html">Accordion</a></li>
                <li class="sidebar-item"><a class="sidebar-link @@component_alerts_active" href="ui-component-alerts.html">Alerts</a></li>
                <li class="sidebar-item"><a class="sidebar-link @@component_badges_active" href="ui-component-badges.html">Badges</a></li>
                <li class="sidebar-item"><a class="sidebar-link @@component_buttons_active" href="ui-component-buttons.html">Buttons</a></li>
                <li class="sidebar-item"><a class="sidebar-link @@component_cards_active" href="ui-component-cards.html">Cards</a></li>
                <li class="sidebar-item"><a class="sidebar-link @@component_carousel_active" href="ui-component-carousel.html">Carousel</a> </li>
                <li class="sidebar-item"><a class="sidebar-link @@component_collapse_active" href="ui-component-collapse.html">Collapse</a> </li>
                <li class="sidebar-item"><a class="sidebar-link @@component_dropdown_active" href="ui-component-dropdown.html">Dropdowns</a> </li>
                <li class="sidebar-item"><a class="sidebar-link @@component_modals_active" href="ui-component-modals.html">Modal</a> </li>
                <li class="sidebar-item"><a class="sidebar-link @@component_offcanvas_active" href="ui-component-offcanvas.html">Offcanvas</a></li>
                <li class="sidebar-item"><a class="sidebar-link @@component_icons_material_active" href="ui-component-icons-material-symbols.html">Material Sysmbols</a>
                </li>
                <li class="sidebar-item"><a class="sidebar-link @@component_icons_bootstrap_active" href="ui-component-icons-bootstrap.html">Bootstrap
                    Icons <span class="badge bg-info ms-2">1.10.3</span></a></li>
                <li class="sidebar-item"><a class="sidebar-link @@component_progress_active" href="ui-component-progress.html">Progress</a></li>
                <li class="sidebar-item"><a class="sidebar-link @@component_spinners_active" href="ui-component-spinners.html">Spinners</a> </li>
                <li class="sidebar-item"><a class="sidebar-link @@component_swiper_active" href="ui-component-swiper-slider.html">Swiper Slider</a> </li>
                <li class="sidebar-item"><a class="sidebar-link @@component_typo_active" href="ui-component-typography.html">Typography</a></li>
                <li class="sidebar-item"><a class="sidebar-link @@component_toast_active" href="ui-component-toast.html">Toast</a></li>
                <li class="sidebar-item"><a class="sidebar-link @@component_bs_tables_active" href="ui-component-tables.html">Tables</a></li>
                <li class="sidebar-item"><a class="sidebar-link @@component_tippy_active" href="ui-component-tippy-js.html">Tippy.js</a></li>
               </ul>
            </li>
            <li class="nav-item">
              <a href="charts.html"
                class="nav-link d-flex align-items-center text-truncate ">
                <span class="sidebar-icon">
                  <span class="material-symbols-rounded">
                    auto_graph
                    </span>
                </span>
                <span class="sidebar-text">Charts</span>
              </a>
            </li>
            <li class="nav-item">
              <a href="maps.html"
                class="nav-link d-flex align-items-center text-truncate ">
                <span class="sidebar-icon">
                  <span class="material-symbols-rounded">
                    map
                    </span>
                </span>
                <span class="sidebar-text">Maps</span>
              </a>
            </li>
            <li class="nav-item">
              <a href="datatables.html"
                class="nav-link d-flex align-items-center text-truncate ">
                <span class="sidebar-icon">
                  <span class="material-symbols-rounded">
                    database
                    </span>
                </span>
                <span class="sidebar-text">Datatables</span>
              </a>
            </li>
            <li class="nav-item">
              <a href="#component-forms" data-bs-toggle="collapse" aria-expanded="false"
                class="nav-link d-flex align-items-center text-truncate ">
                <span class="sidebar-icon">
                  <span class="material-symbols-rounded">
                    edit_note
                    </span>
                </span>
                <!--Sidebar nav text-->
                <span class="sidebar-text">Forms</span>
              </a>
              <ul id="component-forms" class="sidebar-dropdown list-unstyled collapse @@form_collapse_show">
                <li class="sidebar-item"><a class="sidebar-link @@form_bootstrap" href="ui-form-bootstrap.html">
                    Bootstrap</a></li>
                <li class="sidebar-item"><a class="sidebar-link @@form_quill_editor" href="ui-form-editor.html">
                    Editor</a></li>
                <li class="sidebar-item"><a class="sidebar-link @@form_stepper" href="ui-form-stepper.html">
                    Stepper</a></li>
                <li class="sidebar-item"><a class="sidebar-link @@form_upload" href="ui-form-upload.html">
                    Upload</a></li>
                <li class="sidebar-item"><a class="sidebar-link @@form_daterangepicker" href="ui-form-daterange-picker.html">
                    Daterangepicker</a></li>
                <li class="sidebar-item"><a class="sidebar-link @@form_validation" href="ui-form-validation.html">
                    Validation</a></li>
                <li class="sidebar-item"><a class="sidebar-link @@form_choices" href="ui-form-choices.html">
                    Choices</a></li>
                <li class="sidebar-item"><a class="sidebar-link @@form_input_mask" href="ui-form-inputmask.html">
                    Inputmask</a></li>
              </ul>
            </li>
            <li class="nav-item">
              <a class="nav-link d-flex align-items-center" href="#multi-level" data-bs-toggle="collapse" aria-expanded="false">
                <div class="d-flex align-items-center">
                  <span class="sidebar-icon">
                    <span class="material-symbols-rounded">
                      layers
                      </span>
                  </span>
                  <span class="sidebar-text">Multi level</span>
                </div>
              </a>
              <ul id="multi-level" class="collapse sidebar-dropdown list-unstyled mb-0">
                <li class="sidebar-item">
                  <a href="#level-2" data-bs-toggle="collapse" aria-expanded="false" class="sidebar-link">Level
                    Two</a>
                  <ul id="level-2" class="collapse sidebar-dropdown list-unstyled mb-0">

                    <li class="sidebar-item">
                      <a href="#level-3" data-bs-toggle="collapse" aria-expanded="false" class="sidebar-link">Level
                        two item 2</a>
                      <ul id="level-3" class="collapse sidebar-dropdown list-unstyled mb-0">
                        <li class="sidebar-item">
                          <a href="#!" class="sidebar-link">Level three item 1</a>
                        </li>
                      </ul>
                    </li>
                  </ul>
                </li>
              </ul>
            </li>
          </ul>
        </nav>
        <!--aside-info-box-->
        <div class="my-3 p-3 aside-info bg-gradient-primary shadow-lg text-white rounded-4 position-relative overflow-hidden">
          <svg style="transform: rotate(-180deg);" preserveAspectRatio="none" class="position-absolute text-white start-0 bottom-0 w-100" fill="currentColor" height="35%" viewBox="0 0 1200 120" xmlns="http://www.w3.org/2000/svg">
            <path d="M0 0v46.29c47.79 22.2 103.59 32.17 158 28 70.36-5.37 136.33-33.31 206.8-37.5 73.84-4.36 147.54 16.88 218.2 35.26 69.27 18 138.3 24.88 209.4 13.08 36.15-6 69.85-17.84 104.45-29.34C989.49 25 1113-14.29 1200 52.47V0z" opacity=".1"></path>
            <path d="M0 0v15.81c13 21.11 27.64 41.05 47.69 56.24C99.41 111.27 165 111 224.58 91.58c31.15-10.15 60.09-26.07 89.67-39.8 40.92-19 84.73-46 130.83-49.67 36.26-2.85 70.9 9.42 98.6 31.56 31.77 25.39 62.32 62 103.63 73 40.44 10.79 81.35-6.69 119.13-24.28s75.16-39 116.92-43.05c59.73-5.85 113.28 22.88 168.9 38.84 30.2 8.66 59 6.17 87.09-7.5 22.43-10.89 48-26.93 60.65-49.24V0z" opacity=".25"></path>
            <path d="M0 0v5.63C149.93 59 314.09 71.32 475.83 42.57c43-7.64 84.23-20.12 127.61-26.46 59-8.63 112.48 12.24 165.56 35.4C827.93 77.22 886 95.24 951.2 90c86.53-7 172.46-45.71 248.8-84.81V0z" opacity=".25"></path>
          </svg>
         <div class="position-relative">
          <p class="mb-0 pb-2">Release your maximal potencial software</p>
          <!--Action button-->
          <a href="#!.html" class="btn rounded-pill btn-white shadow-sm text-truncate px-3 btn-sm">Upgrade Pro</a>
         </div>
        </div>
      </div>
    </div>
  </aside>
  <!--///////////Page Sidebar End///////////////-->
   <!--///Sidebar close button for 991px or below devices///-->
  <div
  class="sidebar-close d-lg-none">
  <a href="#"></a>
  </div>
  <!--///.Sidebar close end///-->
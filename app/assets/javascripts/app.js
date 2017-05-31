// var id_active;
// $(document).on('turbolinks:load', function() {
//     menu_check_sizes();
//     $(window).resize(menu_check_sizes);
// // ------- ACTIVAR MENU MOVIL ----------------
//     $('[data-toggle-menu]').on("click", function(){
//         console.log("click");
//         $("#overlay-nav-menu").toggleClass("is-open");
//     });
// });
// function menu_check_sizes(){
//     console.log(id_active);
//     if ($(window).width()<640) {
//         // if ($("#nav-row").hasClass("row")) {
//         //     $("#nav-row").removeClass("row");
//         // }
//         // if($("#nav-container").hasClass("column")){
//         //     $("#nav-container").removeClass("column");
//         //     $("#nav-container").removeClass("medium-10");
//         //     $("#nav-container").removeClass("medium-offset-1");
//         // }
//         if(!$("#overlay-nav-menu").hasClass("overlay-nav-menu")){
//             $("#overlay-nav-menu").addClass("overlay-nav-menu");
//         }
//         if($("#overlay-nav-menu").hasClass("menu-hover-lines")){
//             $("#overlay-nav-menu").removeClass("menu-hover-lines");
//             $("#overlay-nav-menu").removeClass("menu");
//         }
//         if($("#overlay-nav-menu>li").hasClass("active")){
//             id_active = $("#overlay-nav-menu>li.active").index();
//             $("#overlay-nav-menu>li.active").removeClass("active");
//         }
//         if($(".overlay-nav-menu-toggle").css("visibility")=="hidden"){
//             $(".overlay-nav-menu-toggle").css("visibility","visible");
//         }
//
//     } else {
//         if (!$("#nav-row").hasClass("row")) {
//             $("#nav-row").addClass("row");
//         }
//         if(!$("#nav-container").hasClass("column")){
//             $("#nav-container").addClass("column");
//             $("#nav-container").addClass("medium-10");
//             $("#nav-container").addClass("medium-offset-1");
//         }
//         if($("#overlay-nav-menu").hasClass("overlay-nav-menu")){
//             $("#overlay-nav-menu").removeClass("overlay-nav-menu");
//         }
//         if(!$("#overlay-nav-menu").hasClass("menu-hover-lines")){
//             $("#overlay-nav-menu").addClass("menu-hover-lines");
//             $("#overlay-nav-menu").addClass("menu");
//         }
//         $("#overlay-nav-menu>li:eq("+id_active+")").addClass("active");
//         if(!($(".overlay-nav-menu-toggle").css("visibility")=="hidden")){
//             $(".overlay-nav-menu-toggle").css("visibility","hidden");
//         }
//     }
// }
//

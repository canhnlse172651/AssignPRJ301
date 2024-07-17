/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



    document.addEventListener('DOMContentLoaded', (event) => {
        const items = document.querySelectorAll('.category-item');

        console.log('items', items)
        
        items.forEach(item => {
            item.addEventListener('click', () => {
                // Xóa lớp 'active' khỏi tất cả các mục
                items.forEach(i => i.classList.remove('active'));
                
                // Thêm lớp 'active' vào mục được nhấp
                item.classList.add('active');
            });
        });
    });


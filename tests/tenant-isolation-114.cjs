'use strict';

const fs=require('fs');
const assert=require('assert');

const auth=fs.readFileSync('src/auth.php','utf8');
const teacherPanel=fs.readFileSync('ogretmen-paneli.php','utf8');
const parentPanel=fs.readFileSync('veli-paneli.php','utf8');
const activities=fs.readFileSync('api/activities.php','utf8');
const activitiesClient=fs.readFileSync('activities-extra.js','utf8');

// Öğretmen erişimi: ilişki tek başına yeterli değildir; öğretmen ve öğrenci
// aynı aktif kurum üyeliğini paylaşmalıdır.
assert(auth.includes("INNER JOIN kurum_kullanicilari kt"));
assert(auth.includes("kt.kurum_rolu='ogretmen'"));
assert(auth.includes("INNER JOIN kurumlar k"));
assert(auth.includes("INNER JOIN kurum_kullanicilari ks"));
assert(auth.includes("ks.kurum_id=kt.kurum_id"));
assert(auth.includes("ks.kurum_rolu='ogrenci'"));

// Veli erişimi de aynı tenant sınırına tabidir.
assert(auth.includes("INNER JOIN kurum_kullanicilari vk"));
assert(auth.includes("vk.kurum_rolu='veli'"));
assert(auth.includes("sk.kurum_id=vk.kurum_id"));
assert(auth.includes("sk.kurum_rolu='ogrenci'"));

// Rol panelleri, doğrudan eski eşleştirme tablolarından öğrenci sızdırmamalı.
assert(teacherPanel.includes('auth_accessible_student_ids($pdo,(int)$user[\'id\'])'));
assert(parentPanel.includes('auth_accessible_student_ids($pdo,(int)$user[\'id\'])'));
assert(!teacherPanel.includes('WHERE og.kullanici_id=? AND og.aktif=1 AND o.aktif=1'));
assert(!parentPanel.includes('WHERE v.kullanici_id=? AND v.aktif=1 AND o.aktif=1'));

// Etkinlik tamamlama POST'u CSRF ile korunmalı; istemci tokenı GET cevabından alıp
// POST isteğine taşır.
assert(activities.includes("verify_csrf($_SERVER['HTTP_X_CSRF_TOKEN'] ?? null)"));
assert(activities.includes("['ok'=>true,'games'=>$out,'csrf'=>csrf_token()]"));
assert(activitiesClient.includes("csrfToken=typeof data.csrf==='string'?data.csrf:''"));
assert(activitiesClient.includes("'X-CSRF-Token':csrfToken"));

console.log('Tenant isolation and activity CSRF checks passed');

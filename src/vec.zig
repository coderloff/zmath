const std = @import("std");

pub const vec2 = struct {
    x: f32,
    y: f32,

    // Constructor
    pub fn init(x: f32, y: f32) vec2 {
        return vec2{ .x = x, .y = y };
    }

    // Static Methods
    pub fn up() vec2 {
        return vec2{ .x = 0, .y = 1 };
    }

    pub fn down() vec2 {
        return vec2{ .x = 0, .y = -1 };
    }

    pub fn left() vec2 {
        return vec2{ .x = -1, .y = 0 };
    }

    pub fn right() vec2 {
        return vec2{ .x = 1, .y = 0 };
    }

    pub fn zero() vec2 {
        return vec2{ .x = 0, .y = 0 };
    }

    pub fn one() vec2 {
        return vec2{ .x = 1, .y = 1 };
    }

    pub fn posinf() vec2 {
        return vec2{ .x = std.math.inf(f32), .y = std.math.inf(f32) };
    }

    pub fn neginf() vec2 {
        return vec2{ .x = -std.math.inf(f32), .y = -std.math.inf(f32) };
    }

    pub fn sum(a: vec2, b: vec2) vec2 {
        return vec2{ .x = a.x + b.x, .y = a.y + b.y };
    }

    pub fn diff(a: vec2, b: vec2) vec2 {
        return vec2{ .x = a.x - b.x, .y = a.y - b.y };
    }

    pub fn prod(a: vec2, b: vec2) vec2 {
        return vec2{ .x = a.x * b.x, .y = a.y * b.y };
    }

    pub fn equals(self: vec2, other: vec2) bool {
        return self.x == other.x and self.y == other.y;
    }

    pub fn abs(self: vec2) vec2 {
        return vec2{ .x = @abs(self.x), .y = @abs(self.y) };
    }

    pub fn quot(a: vec2, b: vec2) vec2 {
        return vec2{ .x = a.x / b.x, .y = a.y / b.y };
    }

    pub fn magnitude(self: vec2) f32 {
        return @sqrt(self.x * self.x + self.y * self.y);
    }

    pub fn normalized(self: vec2) vec2 {
        return vec2{ .x = self.x / self.magnitude(), .y = self.y / self.magnitude() };
    }

    pub fn distance(self: vec2, other: vec2) f32 {
        return self.sub(other).magnitude();
    }

    pub fn dot(self: vec2, other: vec2) f32 {
        return self.x * other.x + self.y * other.y;
    }

    pub fn cross(self: vec2, other: vec2) f32 {
        return self.x * other.y - self.y * other.x;
    }

    pub fn lerp(self: vec2, other: vec2, t: f32) vec2 {
        return vec2{ .x = self.x + (other.x - self.x) * t, .y = self.y + (other.y - self.y) * t };
    }

    pub fn angle(self: vec2, other: vec2) f32 {
        return std.math.acos(self.dot(other) / (self.magnitude() * other.magnitude()));
    }

    pub fn max(self: vec2, other: vec2) vec2 {
        return vec2{ .x = @max(self.x, other.x), .y = @max(self.y, other.y) };
    }

    pub fn min(self: vec2, other: vec2) vec2 {
        return vec2{ .x = @min(self.x, other.x), .y = @min(self.y, other.y) };
    }

    pub fn perp(self: vec2) vec2 {
        return vec2{ .x = -self.y, .y = self.x };
    }

    // Instance Methods
    pub fn set(self: *vec2, x: f32, y: f32) void {
        self.x = x;
        self.y = y;
    }

    pub fn add(self: *vec2, other: vec2) void {
        self.x += other.x;
        self.y += other.y;
    }

    pub fn sub(self: *vec2, other: vec2) void {
        self.x -= other.x;
        self.y -= other.y;
    }

    pub fn mul(self: *vec2, other: vec2) void {
        self.x *= other.x;
        self.y *= other.y;
    }

    pub fn div(self: *vec2, other: vec2) void {
        self.x /= other.x;
        self.y /= other.y;
    }

    pub fn normalize(self: *vec2) void {
        self.x /= self.magnitude();
        self.y /= self.magnitude();
    }

    pub fn scale(self: *vec2, multiplier: f32) void {
        self.x *= multiplier;
        self.y *= multiplier;
    }

    pub fn invert(self: *vec2) void {
        self.x = 1/self.x;
        self.y = 1/self.y;
    }

    pub fn negate(self: *vec2) void {
        self.x = -self.x;
        self.y = -self.y;
    }
};

pub const vec3 = struct {
    x: f32,
    y: f32,
    z: f32,
    
    // Constructor
    pub fn init(x: f32, y: f32, z: f32) vec3 {
        return vec3{ .x = x, .y = y, .z = z };
    }

    // Static Methods
    pub fn up() vec3 {
        return vec3{ .x = 0, .y = 1, .z = 0 };
    }
    pub fn down() vec3 {
        return vec3{ .x = 0, .y = -1, .z = 0 };
    }
    pub fn left() vec3 {
        return vec3{ .x = -1, .y = 0, .z = 0 };
    }
    pub fn right() vec3 {
        return vec3{ .x = 1, .y = 0, .z = 0 };
    }
    pub fn forward() vec3 {
        return vec3{ .x = 0, .y = 0, .z = 1 };
    }
    pub fn backward() vec3 {
        return vec3{ .x = 0, .y = 0, .z = -1 };
    }
    pub fn zero() vec3 {
        return vec3{ .x = 0, .y = 0, .z = 0 };
    }
    pub fn one() vec3 {
        return vec3{ .x = 1, .y = 1, .z = 1 };
    }
    pub fn posinf() vec3 {
        return vec3{ .x = std.math.inf(f32), .y = std.math.inf(f32), .z = std.math.inf(f32) };
    }
    pub fn neginf() vec3 {
        return vec3{ .x = -std.math.inf(f32), .y = -std.math.inf(f32), .z = -std.math.inf(f32) };
    }
    pub fn sum(a: vec3, b: vec3) vec3 {
        return vec3{ .x = a.x + b.x, .y = a.y + b.y, .z = a.z + b.z };
    }
    pub fn diff(a: vec3, b: vec3) vec3 {
        return vec3{ .x = a.x - b.x, .y = a.y - b.y, .z = a.z - b.z };
    }
    pub fn prod(a: vec3, b: vec3) vec3 {
        return vec3{ .x = a.x * b.x, .y = a.y * b.y, .z = a.z * b.z };
    }
    pub fn equals(self: vec3, other: vec3) bool {
        return self.x == other.x and self.y == other.y and self.z == other.z;
    }
    pub fn abs(self: vec3) vec3 {
        return vec3{ .x = @abs(self.x), .y = @abs(self.y), .z = @abs(self.z) };
    }
    pub fn quot(a: vec3, b: vec3) vec3 {
        return vec3{ .x = a.x / b.x, .y = a.y / b.y, .z = a.z / b.z };
    }
    pub fn magnitude(self: vec3) f32 {
        return @sqrt(self.x * self.x + self.y * self.y + self.z * self.z);
    }
    pub fn normalized(self: vec3) vec3 {
        return vec3{ .x = self.x / self.magnitude(), .y = self.y / self.magnitude(), .z = self.z / self.magnitude() };
    }
    pub fn distance(self: vec3, other: vec3) f32 {
        return self.sub(other).magnitude();
    }
    pub fn dot(self: vec3, other: vec3) f32 {
        return self.x * other.x + self.y * other.y + self.z * other.z;
    }
    pub fn cross(self: vec3, other: vec3) vec3 {
        return vec3{
            .x = self.y * other.z - self.z * other.y,
            .y = self.z * other.x - self.x * other.z,
            .z = self.x * other.y - self.y * other.x,
        };
    }
    pub fn lerp(self: vec3, other: vec3, t: f32) vec3 {
        return vec3{
            .x = self.x + (other.x - self.x) * t,
            .y = self.y + (other.y - self.y) * t,
            .z = self.z + (other.z - self.z) * t,
        };
    }
    pub fn angle(self: vec3, other: vec3) f32 {
        return std.math.acos(self.dot(other) / (self.magnitude() * other.magnitude()));
    }
    pub fn max(self: vec3, other: vec3) vec3 {
        return vec3{ .x = @max(self.x, other.x), .y = @max(self.y, other.y), .z = @max(self.z, other.z) };
    }
    pub fn min(self: vec3, other: vec3) vec3 {
        return vec3{ .x = @min(self.x, other.x), .y = @min(self.y, other.y), .z = @min(self.z, other.z) };
    }
    pub fn perp(self: vec3) vec3 {
        return vec3{ .x = -self.y, .y = self.x, .z = self.z };
    }

    // Instance Methods
    pub fn set(self: *vec3, x: f32, y: f32, z: f32) void {
        self.x = x;
        self.y = y;
        self.z = z;
    }
    pub fn add(self: *vec3, other: vec3) void {
        self.x += other.x;
        self.y += other.y;
        self.z += other.z;
    }
    pub fn sub(self: *vec3, other: vec3) void {
        self.x -= other.x;
        self.y -= other.y;
        self.z -= other.z;
    }
    pub fn mul(self: *vec3, other: vec3) void {
        self.x *= other.x;
        self.y *= other.y;
        self.z *= other.z;
    }
    pub fn div(self: *vec3, other: vec3) void {
        self.x /= other.x;
        self.y /= other.y;
        self.z /= other.z;
    }
    pub fn normalize(self: *vec3) void {
        self.x /= self.magnitude();
        self.y /= self.magnitude();
        self.z /= self.magnitude();
    }
    pub fn scale(self: *vec3, multiplier: f32) void {
        self.x *= multiplier;
        self.y *= multiplier;
        self.z *= multiplier;
    }
    pub fn invert(self: *vec3) void {
        self.x = 1/self.x;
        self.y = 1/self.y;
        self.z = 1/self.z;
    }
    pub fn negate(self: *vec3) void {
        self.x = -self.x;
        self.y = -self.y;
        self.z = -self.z;
    }
};

pub const vec4 = struct {
    x: f32,
    y: f32,
    z: f32,
    w: f32,

    // Constructor
    pub fn init(x: f32, y: f32, z: f32, w: f32) vec4 {
        return vec4{ .x = x, .y = y, .z = z, .w = w };
    }

    // Static Methods
    pub fn up() vec4 {
        return vec4{ .x = 0, .y = 1, .z = 0, .w = 0 };
    }
    pub fn down() vec4 {
        return vec4{ .x = 0, .y = -1, .z = 0, .w = 0 };
    }
    pub fn left() vec4 {
        return vec4{ .x = -1, .y = 0, .z = 0, .w = 0 };
    }
    pub fn right() vec4 {
        return vec4{ .x = 1, .y = 0, .z = 0, .w = 0 };
    }
    pub fn forward() vec4 {
        return vec4{ .x = 0, .y = 0, .z = 1, .w = 0 };
    }
    pub fn backward() vec4 {
        return vec4{ .x = 0, .y = 0, .z = -1, .w = 0 };
    }
    pub fn zero() vec4 {
        return vec4{ .x = 0, .y = 0, .z = 0, .w = 0 };
    }
    pub fn one() vec4 {
        return vec4{ .x = 1, .y = 1, .z = 1, .w = 1 };
    }
    pub fn posinf() vec4 {
        return vec4{ .x = std.math.inf(f32), .y = std.math.inf(f32), .z = std.math.inf(f32), .w = std.math.inf(f32) };
    }
    pub fn neginf() vec4 {
        return vec4{ .x = -std.math.inf(f32), .y = -std.math.inf(f32), .z = -std.math.inf(f32), .w = -std.math.inf(f32) };
    }
    pub fn sum(a: vec4, b: vec4) vec4 {
        return vec4{ .x = a.x + b.x, .y = a.y + b.y, .z = a.z + b.z, .w = a.w + b.w };
    }
    pub fn diff(a: vec4, b: vec4) vec4 {
        return vec4{ .x = a.x - b.x, .y = a.y - b.y, .z = a.z - b.z, .w = a.w - b.w };
    }
    pub fn prod(a: vec4, b: vec4) vec4 {
        return vec4{ .x = a.x * b.x, .y = a.y * b.y, .z = a.z * b.z, .w = a.w * b.w };
    }
    pub fn equals(self: vec4, other: vec4) bool {
        return self.x == other.x and self.y == other.y and self.z == other.z and self.w == other.w;
    }
    pub fn abs(self: vec4) vec4 {
        return vec4{ .x = @abs(self.x), .y = @abs(self.y), .z = @abs(self.z), .w = @abs(self.w) };
    }
    pub fn quot(a: vec4, b: vec4) vec4 {
        return vec4{ .x = a.x / b.x, .y = a.y / b.y, .z = a.z / b.z, .w = a.w / b.w };
    }
    pub fn magnitude(self: vec4) f32 {
        return @sqrt(self.x * self.x + self.y * self.y + self.z * self.z + self.w * self.w);
    }
    pub fn normalized(self: vec4) vec4 {
        return vec4{ .x = self.x / self.magnitude(), .y = self.y / self.magnitude(), .z = self.z / self.magnitude(), .w = self.w / self.magnitude() };
    }
    pub fn distance(self: vec4, other: vec4) f32 {
        return self.sub(other).magnitude();
    }
    pub fn dot(self: vec4, other: vec4) f32 {
        return self.x * other.x + self.y * other.y + self.z * other.z + self.w * other.w;
    }
    pub fn lerp(self: vec4, other: vec4, t: f32) vec4 {
        return vec4{
            .x = self.x + (other.x - self.x) * t,
            .y = self.y + (other.y - self.y) * t,
            .z = self.z + (other.z - self.z) * t,
            .w = self.w + (other.w - self.w) * t,
        };
    }
    pub fn angle(self: vec4, other: vec4) f32 {
        return std.math.acos(self.dot(other) / (self.magnitude() * other.magnitude()));
    }
    pub fn max(self: vec4, other: vec4) vec4 {
        return vec4{ .x = @max(self.x, other.x), .y = @max(self.y, other.y), .z = @max(self.z, other.z), .w = @max(self.w, other.w) };
    }
    pub fn min(self: vec4, other: vec4) vec4 {
        return vec4{ .x = @min(self.x, other.x), .y = @min(self.y, other.y), .z = @min(self.z, other.z), .w = @min(self.w, other.w) };
    }
    pub fn perp(self: vec4) vec4 {
        return vec4{ .x = -self.y, .y = self.x, .z = self.z, .w = self.w };
    }

    // Instance Methods
    pub fn set(self: *vec4, x: f32, y: f32, z: f32, w: f32) void {
        self.x = x;
        self.y = y;
        self.z = z;
        self.w = w;
    }
    pub fn add(self: *vec4, other: vec4) void {
        self.x += other.x;
        self.y += other.y;
        self.z += other.z;
        self.w += other.w;
    }
    pub fn sub(self: *vec4, other: vec4) void {
        self.x -= other.x;
        self.y -= other.y;
        self.z -= other.z;
        self.w -= other.w;
    }
    pub fn mul(self: *vec4, other: vec4) void {
        self.x *= other.x;
        self.y *= other.y;
        self.z *= other.z;
        self.w *= other.w;
    }
    pub fn div(self: *vec4, other: vec4) void {
        self.x /= other.x;
        self.y /= other.y;
        self.z /= other.z;
        self.w /= other.w;
    }
    pub fn normalize(self: *vec4) void {
        self.x /= self.magnitude();
        self.y /= self.magnitude();
        self.z /= self.magnitude();
        self.w /= self.magnitude();
    }
    pub fn scale(self: *vec4, multiplier: f32) void {
        self.x *= multiplier;
        self.y *= multiplier;
        self.z *= multiplier;
        self.w *= multiplier;
    }
    pub fn invert(self: *vec4) void {
        self.x = 1/self.x;
        self.y = 1/self.y;
        self.z = 1/self.z;
        self.w = 1/self.w;
    }
    pub fn negate(self: *vec4) void {
        self.x = -self.x;
        self.y = -self.y;
        self.z = -self.z;
        self.w = -self.w;
    }
};
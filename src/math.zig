const std = @import("std");

pub const vec2 = struct {
    x: f32,
    y: f32,

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

    pub fn set(self: *vec2, x: f32, y: f32) void {
        self.x = x;
        self.y = y;
    }

    pub fn equals(self: vec2, other: vec2) bool {
        return self.x == other.x and self.y == other.y;
    }

    pub fn abs(self: vec2) vec2 {
        return vec2{ .x = @abs(self.x), .y = @abs(self.y) };
    }

    pub fn normalize(self: *vec2) void {
        self.x /= self.magnitude();
        self.y /= self.magnitude();
    }

    pub fn scale(self: *vec2, multiplier: f32) void {
        self.x *= multiplier;
        self.y *= multiplier;
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

    pub fn magnitude(self: vec2) f32 {
        return @sqrt(self.x * self.x + self.y * self.y);
    }

    pub fn normalized(self: *vec2) vec2 {
        return vec2{ .x = self.x / self.magnitude(), .y = self.y / self.magnitude() };
    }

    pub fn distance(self: vec2, other: vec2) f32 {
        return self.sub(other).magnitude();
    }

    pub fn dot(self: vec2, other: vec2) f32 {
        return self.x * other.x + self.y * other.y;
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
};

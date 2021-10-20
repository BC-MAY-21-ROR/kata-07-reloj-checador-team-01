module AttendancesHelper
    def assign_user(attendance, creator)
        attendance.user = creator
        attendance
    end

    def assign_employee(attendance, creator)
        attendance.employee = creator
        attendance
    end
end

module AttendancesHelper
    def assign_employee(attendance, creator)
        attendance.employee = creator
        attendance
    end
end
